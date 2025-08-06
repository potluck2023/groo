import React, { createContext, useContext, useEffect, useState } from 'react';
import { Session, User } from '@supabase/supabase-js';
import { Platform } from 'react-native';
import * as WebBrowser from 'expo-web-browser';
import { router } from 'expo-router';
import { supabase } from '../lib/supabase';

interface AuthContextType {
  session: Session | null;
  user: User | null;
  loading: boolean;
  signInWithGoogle: () => Promise<void>;
  signOut: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [session, setSession] = useState<Session | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session);
      setUser(session?.user ?? null);
      setLoading(false);
    });

    // Listen for auth changes
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session);
      setUser(session?.user ?? null);
      setLoading(false);
    });

    return () => subscription.unsubscribe();
  }, []);

  const signInWithGoogle = async () => {
    try {
      // 환경 변수 확인
      const supabaseUrl = process.env.EXPO_PUBLIC_SUPABASE_URL;
      const supabaseKey = process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY;
      
      if (!supabaseUrl || !supabaseKey || 
          supabaseUrl === 'your_supabase_project_url_here' || 
          supabaseKey === 'your_supabase_anon_key_here') {
        throw new Error('Supabase 환경 변수가 설정되지 않았습니다. .env 파일을 확인해주세요.');
      }

      console.log('Starting Google OAuth...');
      
      // 플랫폼에 따라 다른 redirect URL 사용
      const redirectTo = Platform.OS === 'web' 
        ? `${window.location.origin}/auth/callback`
        : 'groorn://auth/callback';
      
      console.log('Using redirect URL:', redirectTo);
      
      const { data, error } = await supabase.auth.signInWithOAuth({
        provider: 'google',
        options: {
          redirectTo,
        },
      });
      
      console.log('OAuth response:', { data, error });
      
      if (error) {
        console.error('OAuth error:', error);
        throw error;
      }
      
      // OAuth URL이 반환되었는지 확인
      if (!data?.url) {
        throw new Error('OAuth URL을 받지 못했습니다. Supabase 설정을 확인해주세요.');
      }
      
      console.log('OAuth URL received:', data.url);
      
      // 모바일 환경에서는 WebBrowser로 OAuth URL 열기
      if (Platform.OS !== 'web') {
        console.log('Opening OAuth URL in WebBrowser...');
        const result = await WebBrowser.openAuthSessionAsync(
          data.url,
          redirectTo
        );
        
        console.log('WebBrowser result:', result);
        
        if (result.type === 'success' && result.url) {
          // URL에서 토큰 추출 (해시 또는 쿼리 파라미터에서)
          const url = new URL(result.url);
          let accessToken: string | null = null;
          let refreshToken: string | null = null;
          
          // 1. 해시(#) 부분에서 토큰 추출 시도
          if (url.hash) {
            const hashParams = new URLSearchParams(url.hash.substring(1));
            accessToken = hashParams.get('access_token');
            refreshToken = hashParams.get('refresh_token');
          } 
          // 2. 쿼리 파라미터에서 토큰 추출 시도
          else {
            accessToken = url.searchParams.get('access_token');
            refreshToken = url.searchParams.get('refresh_token');
          }
          
          console.log('Extracted tokens:', { accessToken: !!accessToken, refreshToken: !!refreshToken });
          
          if (accessToken && refreshToken) {
            console.log('Tokens extracted from callback URL');
            const { error: sessionError } = await supabase.auth.setSession({
              access_token: accessToken,
              refresh_token: refreshToken,
            });
            
            if (sessionError) {
              console.error('Session error:', sessionError);
              throw sessionError;
            }
            
            console.log('Mobile OAuth login successful');
            // 로그인 성공 후 홈 화면으로 리다이렉션
            router.replace('/(tabs)');
          } else {
            throw new Error('OAuth 콜백에서 토큰을 찾을 수 없습니다.');
          }
        } else if (result.type === 'cancel') {
          throw new Error('사용자가 로그인을 취소했습니다.');
        } else {
          throw new Error('OAuth 로그인에 실패했습니다.');
        }
      }
    } catch (error) {
      console.error('Error signing in with Google:', error);
      throw error;
    }
  };

  const signOut = async () => {
    try {
      const { error } = await supabase.auth.signOut();
      if (error) throw error;
    } catch (error) {
      console.error('Error signing out:', error);
      throw error;
    }
  };

  const value = {
    session,
    user,
    loading,
    signInWithGoogle,
    signOut,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}

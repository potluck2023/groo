import React, { useEffect } from 'react';
import { View, ActivityIndicator, Platform } from 'react-native';
import { router, useLocalSearchParams } from 'expo-router';
import { supabase } from '@/lib/supabase';
import { ThemedView } from '@/components/ThemedView';
import { ThemedText } from '@/components/ThemedText';

export default function AuthCallback() {
  const params = useLocalSearchParams();

  useEffect(() => {
    const handleAuthCallback = async () => {
      try {
        console.log('Auth callback triggered with params:', params);
        
        if (Platform.OS === 'web') {
          // 웹 환경: URL hash에서 토큰 추출
          const hashParams = new URLSearchParams(window.location.hash.substring(1));
          const accessToken = hashParams.get('access_token');
          const refreshToken = hashParams.get('refresh_token');
          
          console.log('Web tokens:', { accessToken: !!accessToken, refreshToken: !!refreshToken });
          
          if (accessToken && refreshToken) {
            const { error } = await supabase.auth.setSession({
              access_token: accessToken,
              refresh_token: refreshToken,
            });
            
            if (error) {
              console.error('Web auth callback error:', error);
              router.replace('/login');
              return;
            }
            
            console.log('Web login successful, redirecting to home');
            router.replace('/(tabs)');
          } else {
            console.log('No web tokens found, redirecting to login');
            router.replace('/login');
          }
        } else {
          // 모바일 환경: URL 해시 또는 파라미터에서 토큰 추출 시도
          let accessToken: string | null = null;
          let refreshToken: string | null = null;
          
          // 1. 해시(#) 부분에서 토큰 추출 시도
          if (window.location.hash) {
            const hashParams = new URLSearchParams(window.location.hash.substring(1));
            accessToken = hashParams.get('access_token');
            refreshToken = hashParams.get('refresh_token');
          } 
          // 2. 파라미터에서 토큰 추출 시도
          else if (params) {
            accessToken = params.access_token as string;
            refreshToken = params.refresh_token as string;
          }
          
          console.log('Mobile tokens:', { accessToken: !!accessToken, refreshToken: !!refreshToken });
          
          if (accessToken && refreshToken) {
            const { error } = await supabase.auth.setSession({
              access_token: accessToken,
              refresh_token: refreshToken,
            });
            
            if (error) {
              console.error('Mobile auth callback error:', error);
              router.replace('/login');
              return;
            }
            
            console.log('Mobile login successful, redirecting to home');
            router.replace('/(tabs)');
          } else {
            console.log('No mobile tokens found, redirecting to login');
            router.replace('/login');
          }
        }
      } catch (error) {
        console.error('Auth callback error:', error);
        router.replace('/login');
      }
    };

    // 약간의 지연을 두어 URL이 완전히 로드되도록 함
    const timer = setTimeout(handleAuthCallback, 100);
    return () => clearTimeout(timer);
  }, [params]);

  return (
    <ThemedView style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <ActivityIndicator size="large" />
      <ThemedText style={{ marginTop: 16 }}>로그인 처리 중...</ThemedText>
    </ThemedView>
  );
}

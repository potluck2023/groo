import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Alert,
  ActivityIndicator,
} from 'react-native';
import { router } from 'expo-router';
import { useAuth } from '@/contexts/AuthContext';
import { ThemedView } from '@/components/ThemedView';
import { ThemedText } from '@/components/ThemedText';

export default function LoginScreen() {
  const { signInWithGoogle } = useAuth();
  const [loading, setLoading] = useState(false);

  const handleGoogleLogin = async () => {
    try {
      setLoading(true);
      await signInWithGoogle();
      // OAuth URL이 성공적으로 생성되면 브라우저가 열림
      // 실제 로그인 완료는 auth state change에서 처리됨
    } catch (error: any) {
      console.error('Login error:', error);
      
      let errorMessage = '로그인 중 문제가 발생했습니다.';
      
      if (error.message?.includes('환경 변수')) {
        errorMessage = '앱 설정이 완료되지 않았습니다.\n개발자에게 문의해주세요.';
      } else if (error.message?.includes('OAuth URL')) {
        errorMessage = 'Google 로그인 설정에 문제가 있습니다.\n잠시 후 다시 시도해주세요.';
      } else if (error.message?.includes('network')) {
        errorMessage = '네트워크 연결을 확인하고 다시 시도해주세요.';
      }
      
      Alert.alert(
        '로그인 오류',
        errorMessage,
        [{ text: '확인' }]
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <ThemedView style={styles.container}>
      <View style={styles.content}>
        <ThemedText style={styles.title}>GROO에 로그인</ThemedText>
        <ThemedText style={styles.subtitle}>
          로그인하여 독서 기록을 백업하고{'\n'}
          다른 기기에서도 동기화하세요
        </ThemedText>

        <TouchableOpacity
          style={[styles.googleButton, loading && styles.buttonDisabled]}
          onPress={handleGoogleLogin}
          disabled={loading}
        >
          {loading ? (
            <ActivityIndicator color="#fff" size="small" />
          ) : (
            <>
              <Text style={styles.googleIcon}>G</Text>
              <Text style={styles.buttonText}>Google로 로그인</Text>
            </>
          )}
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.skipButton}
          onPress={() => router.back()}
        >
          <ThemedText style={styles.skipText}>나중에 하기</ThemedText>
        </TouchableOpacity>
      </View>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  content: {
    width: '100%',
    maxWidth: 300,
    alignItems: 'center',
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    marginBottom: 16,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: 16,
    textAlign: 'center',
    marginBottom: 40,
    lineHeight: 24,
    opacity: 0.8,
  },
  googleButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#4285F4',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
    width: '100%',
    marginBottom: 20,
  },
  buttonDisabled: {
    opacity: 0.6,
  },
  googleIcon: {
    color: '#fff',
    fontSize: 18,
    fontWeight: 'bold',
    marginRight: 12,
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '600',
  },
  skipButton: {
    paddingVertical: 12,
    paddingHorizontal: 24,
  },
  skipText: {
    fontSize: 16,
    textDecorationLine: 'underline',
  },
});

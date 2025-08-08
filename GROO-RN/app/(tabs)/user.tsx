import { StyleSheet, View, TouchableOpacity, Alert } from 'react-native';
import { router } from 'expo-router';

import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import { useAuth } from '@/contexts/AuthContext';

export default function UserScreen() {
  const { user, loading, signOut } = useAuth();

  const handleLogin = () => {
    router.push('/login');
  };

  const handleLogout = async () => {
    Alert.alert(
      '로그아웃',
      '정말 로그아웃하시겠습니까?',
      [
        { text: '취소', style: 'cancel' },
        {
          text: '로그아웃',
          style: 'destructive',
          onPress: async () => {
            try {
              await signOut();
            } catch (error) {
              Alert.alert('오류', '로그아웃 중 문제가 발생했습니다.');
            }
          },
        },
      ]
    );
  };

  if (loading) {
    return (
      <ThemedView style={styles.container}>
        <ThemedView style={styles.titleContainer}>
          <ThemedText type="title">User</ThemedText>
        </ThemedView>
        <ThemedView style={styles.contentContainer}>
          <ThemedText>로딩 중...</ThemedText>
        </ThemedView>
      </ThemedView>
    );
  }

  return (
    <ThemedView style={styles.container}>
      <ThemedView style={styles.titleContainer}>
        <ThemedText type="title">User</ThemedText>
      </ThemedView>
      
      {user ? (
        // 로그인된 상태
        <ThemedView style={styles.contentContainer}>
          <View style={styles.profileSection}>
            <ThemedText style={styles.welcomeText}>
              안녕하세요! 👋
            </ThemedText>
            <ThemedText style={styles.emailText}>
              {user.email}
            </ThemedText>
            <ThemedText style={styles.backupStatus}>
              ✅ 독서 기록이 안전하게 백업되고 있습니다
            </ThemedText>
          </View>
          
          <TouchableOpacity style={styles.logoutButton} onPress={handleLogout}>
            <ThemedText style={styles.logoutButtonText}>로그아웃</ThemedText>
          </TouchableOpacity>
        </ThemedView>
      ) : (
        // 로그인되지 않은 상태
        <ThemedView style={styles.contentContainer}>
          <View style={styles.loginPromptSection}>
            <ThemedText style={styles.promptTitle}>
              📚 독서 기록을 안전하게 보관하세요
            </ThemedText>
            <ThemedText style={styles.promptDescription}>
              로그인하면 독서 기록이 클라우드에 백업되어{"\n"}
              다른 기기에서도 동일한 기록을 확인할 수 있습니다.
            </ThemedText>
            <ThemedText style={styles.promptNote}>
              💡 로그인하지 않아도 앱을 사용할 수 있지만,{"\n"}
              기기를 변경하면 기록이 사라질 수 있습니다.
            </ThemedText>
          </View>
          
          <TouchableOpacity style={styles.loginButton} onPress={handleLogin}>
            <ThemedText style={styles.loginButtonText}>로그인해서 백업하기</ThemedText>
          </TouchableOpacity>
        </ThemedView>
      )}
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  titleContainer: {
    paddingTop: 50,
    paddingBottom: 20,
  },
  contentContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  // 로그인된 상태 스타일
  profileSection: {
    alignItems: 'center',
    marginBottom: 40,
  },
  welcomeText: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 8,
    textAlign: 'center',
  },
  emailText: {
    fontSize: 16,
    marginBottom: 16,
    opacity: 0.8,
  },
  backupStatus: {
    fontSize: 14,
    textAlign: 'center',
    opacity: 0.9,
    lineHeight: 20,
  },
  logoutButton: {
    backgroundColor: '#ff4444',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  logoutButtonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '600',
  },
  // 로그인되지 않은 상태 스타일
  loginPromptSection: {
    alignItems: 'center',
    marginBottom: 40,
    paddingHorizontal: 20,
  },
  promptTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 16,
    textAlign: 'center',
  },
  promptDescription: {
    fontSize: 16,
    textAlign: 'center',
    marginBottom: 16,
    lineHeight: 24,
    opacity: 0.8,
  },
  promptNote: {
    fontSize: 14,
    textAlign: 'center',
    lineHeight: 20,
    opacity: 0.7,
  },
  loginButton: {
    backgroundColor: '#4285F4',
    paddingVertical: 14,
    paddingHorizontal: 32,
    borderRadius: 8,
  },
  loginButtonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '600',
  },
});

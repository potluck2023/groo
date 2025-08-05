import React from 'react';
import { View, FlatList, TouchableOpacity, StyleSheet } from 'react-native';
import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import { IconSymbol } from '@/components/ui/IconSymbol';
import { Colors } from '@/constants/Colors';
import { useColorScheme } from '@/hooks/useColorScheme';
import { ReadingRecord } from '@/types';

interface RecordListProps {
  records: ReadingRecord[];
  onRecordPress?: (record: ReadingRecord) => void;
  onAddRecord?: () => void;
}

export default function RecordList({ records, onRecordPress, onAddRecord }: RecordListProps) {
  const colorScheme = useColorScheme();
  const colors = Colors[colorScheme ?? 'light'];

  const formatDate = (date: Date) => {
    return date.toLocaleDateString('ko-KR', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  };

  const renderStars = (rating?: number) => {
    if (!rating) return null;
    
    return (
      <View style={styles.starsContainer}>
        {[1, 2, 3, 4, 5].map((star) => (
          <IconSymbol
            key={star}
            size={12}
            name={star <= rating ? "star.fill" : "star"}
            color={star <= rating ? "#FFD700" : colors.text + '30'}
          />
        ))}
      </View>
    );
  };

  const renderRecordItem = ({ item }: { item: ReadingRecord }) => (
    <TouchableOpacity
      style={[styles.recordItem, { borderBottomColor: colors.text + '10' }]}
      onPress={() => onRecordPress?.(item)}
      activeOpacity={0.7}
    >
      <View style={styles.recordHeader}>
        <ThemedText style={styles.bookTitle} numberOfLines={1}>
          {item.bookTitle}
        </ThemedText>
        <ThemedText style={styles.date}>
          {formatDate(item.createdAt)}
        </ThemedText>
      </View>
      
      <ThemedText style={styles.author} numberOfLines={1}>
        {item.author}
      </ThemedText>
      
      <ThemedText style={styles.content} numberOfLines={3}>
        {item.content}
      </ThemedText>
      
      {renderStars(item.rating)}
    </TouchableOpacity>
  );

  const renderEmptyState = () => (
    <View style={styles.emptyContainer}>
      <IconSymbol 
        size={60} 
        name="book.closed" 
        color={colors.text + '30'} 
        style={styles.emptyIcon}
      />
      <ThemedText style={styles.emptyTitle}>
        아직 기록된 독서 노트가 없습니다
      </ThemedText>
      <ThemedText style={styles.emptySubtitle}>
        읽은 책에 대한 생각을 기록해보세요
      </ThemedText>
      
      <TouchableOpacity
        style={[styles.addButton, { backgroundColor: colors.tint }]}
        onPress={onAddRecord}
      >
        <IconSymbol size={20} name="plus" color="#FFFFFF" />
        <ThemedText style={styles.addButtonText}>
          첫 기록 작성하기
        </ThemedText>
      </TouchableOpacity>
    </View>
  );

  if (records.length === 0) {
    return renderEmptyState();
  }

  return (
    <View style={styles.container}>
      <FlatList
        data={records}
        renderItem={renderRecordItem}
        keyExtractor={(item) => item.id}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.listContainer}
      />
      
      {/* 플로팅 추가 버튼 */}
      <TouchableOpacity
        style={[styles.floatingButton, { backgroundColor: colors.tint }]}
        onPress={onAddRecord}
      >
        <IconSymbol size={24} name="plus" color="#FFFFFF" />
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  listContainer: {
    paddingHorizontal: 20,
    paddingBottom: 100, // 탭바 + 플로팅 버튼 공간
  },
  recordItem: {
    paddingVertical: 16,
    borderBottomWidth: 1,
  },
  recordHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 4,
  },
  bookTitle: {
    fontSize: 16,
    fontWeight: '600',
    flex: 1,
    marginRight: 10,
  },
  date: {
    fontSize: 12,
    opacity: 0.6,
  },
  author: {
    fontSize: 14,
    opacity: 0.8,
    marginBottom: 8,
  },
  content: {
    fontSize: 14,
    lineHeight: 20,
    marginBottom: 8,
  },
  starsContainer: {
    flexDirection: 'row',
    gap: 2,
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 40,
  },
  emptyIcon: {
    marginBottom: 20,
  },
  emptyTitle: {
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 8,
    textAlign: 'center',
  },
  emptySubtitle: {
    fontSize: 14,
    opacity: 0.7,
    textAlign: 'center',
    marginBottom: 30,
    lineHeight: 20,
  },
  addButton: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 25,
    gap: 8,
  },
  addButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  floatingButton: {
    position: 'absolute',
    bottom: 30,
    right: 20,
    width: 56,
    height: 56,
    borderRadius: 28,
    justifyContent: 'center',
    alignItems: 'center',
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 4,
  },
});

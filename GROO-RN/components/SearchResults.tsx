import React from 'react';
import { View, FlatList, TouchableOpacity, StyleSheet, Dimensions } from 'react-native';
import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import { Colors } from '@/constants/Colors';
import { useColorScheme } from '@/hooks/useColorScheme';
import { Book } from '@/types';

interface SearchResultsProps {
  books: Book[];
  onBookPress?: (book: Book) => void;
  isLoading?: boolean;
}

const { width } = Dimensions.get('window');

export default function SearchResults({ books, onBookPress, isLoading = false }: SearchResultsProps) {
  const colorScheme = useColorScheme();
  const colors = Colors[colorScheme ?? 'light'];

  const renderBookItem = ({ item }: { item: Book }) => (
    <TouchableOpacity
      style={[styles.bookItem, { borderBottomColor: colors.text + '10' }]}
      onPress={() => onBookPress?.(item)}
      activeOpacity={0.7}
    >
      <View style={styles.bookCover}>
        <ThemedText style={styles.bookTitle} numberOfLines={2}>
          {item.title}
        </ThemedText>
      </View>
      
      <View style={styles.bookInfo}>
        <ThemedText style={styles.title} numberOfLines={2}>
          {item.title}
        </ThemedText>
        <ThemedText style={styles.author} numberOfLines={1}>
          {item.authors}
        </ThemedText>
        <ThemedText style={styles.publisher} numberOfLines={1}>
          {item.publisher} • {item.publicationYear}
        </ThemedText>
      </View>
    </TouchableOpacity>
  );

  const renderEmptyState = () => (
    <View style={styles.emptyContainer}>
      <ThemedText style={styles.emptyText}>
        검색 결과가 없습니다
      </ThemedText>
      <ThemedText style={styles.emptySubText}>
        다른 키워드로 검색해보세요
      </ThemedText>
    </View>
  );

  const renderLoadingState = () => (
    <View style={styles.emptyContainer}>
      <ThemedText style={styles.emptyText}>
        검색 중...
      </ThemedText>
    </View>
  );

  if (isLoading) {
    return renderLoadingState();
  }

  if (books.length === 0) {
    return renderEmptyState();
  }

  return (
    <FlatList
      data={books}
      renderItem={renderBookItem}
      keyExtractor={(item) => item.id}
      showsVerticalScrollIndicator={false}
      contentContainerStyle={styles.listContainer}
    />
  );
}

const styles = StyleSheet.create({
  listContainer: {
    paddingHorizontal: 20,
    paddingBottom: 100, // 탭바 공간 확보
  },
  bookItem: {
    flexDirection: 'row',
    paddingVertical: 15,
    borderBottomWidth: 1,
  },
  bookCover: {
    width: 60,
    height: 80,
    backgroundColor: '#f0f0f0',
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 15,
  },
  bookTitle: {
    fontSize: 10,
    fontWeight: '600',
    textAlign: 'center',
    color: '#333',
    paddingHorizontal: 4,
  },
  bookInfo: {
    flex: 1,
    justifyContent: 'space-between',
  },
  title: {
    fontSize: 16,
    fontWeight: '600',
    marginBottom: 4,
  },
  author: {
    fontSize: 14,
    fontWeight: '500',
    opacity: 0.8,
    marginBottom: 2,
  },
  publisher: {
    fontSize: 12,
    opacity: 0.6,
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingTop: 100,
  },
  emptyText: {
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 8,
  },
  emptySubText: {
    fontSize: 14,
    opacity: 0.7,
  },
});

import React from 'react';
import { View, ScrollView, StyleSheet, Dimensions } from 'react-native';
import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import { Book } from '@/types';

interface BookshelfViewProps {
  books: Book[];
}

const { width } = Dimensions.get('window');

export default function BookshelfView({ books }: BookshelfViewProps) {
  // 임시 데이터 (실제로는 props로 받을 예정)
  const sampleBooks: Book[] = [
    {
      id: '1',
      title: '해리 포터와 마법사의 돌',
      imageURL: '',
      authors: 'J.K. 롤링',
      publisher: '문학수첩',
      publicationYear: '2000',
      isbn: '9788983920003'
    },
    {
      id: '2',
      title: '1984',
      imageURL: '',
      authors: '조지 오웰',
      publisher: '민음사',
      publicationYear: '1949',
      isbn: '9788937460777'
    },
    {
      id: '3',
      title: '어린 왕자',
      imageURL: '',
      authors: '생텍쥐페리',
      publisher: '문학동네',
      publicationYear: '1943',
      isbn: '9788954618786'
    },
    {
      id: '4',
      title: '데미안',
      imageURL: '',
      authors: '헤르만 헤세',
      publisher: '민음사',
      publicationYear: '1919',
      isbn: '9788937462788'
    },
    {
      id: '5',
      title: '노르웨이의 숲',
      imageURL: '',
      authors: '무라카미 하루키',
      publisher: '문학사상',
      publicationYear: '1987',
      isbn: '9788970127248'
    },
    {
      id: '6',
      title: '카프카의 변신',
      imageURL: '',
      authors: '프란츠 카프카',
      publisher: '민음사',
      publicationYear: '1915',
      isbn: '9788937460784'
    }
  ];

  const displayBooks = books.length > 0 ? books : sampleBooks;

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <View style={styles.shelf}>
        <View style={styles.shelfBoard} />
        <View style={styles.booksRow}>
          {displayBooks.map((book, index) => (
            <View key={book.id} style={styles.bookSpine}>
              <ThemedText style={styles.bookTitle} numberOfLines={3}>
                {book.title}
              </ThemedText>
              <ThemedText style={styles.bookAuthor} numberOfLines={1}>
                {book.authors}
              </ThemedText>
            </View>
          ))}
        </View>
      </View>
      
      {/* 추가 책장들 */}
      <View style={styles.shelf}>
        <View style={styles.shelfBoard} />
        <View style={styles.booksRow}>
          {displayBooks.slice(0, 4).map((book, index) => (
            <View key={`shelf2-${book.id}`} style={styles.bookSpine}>
              <ThemedText style={styles.bookTitle} numberOfLines={3}>
                {book.title}
              </ThemedText>
              <ThemedText style={styles.bookAuthor} numberOfLines={1}>
                {book.authors}
              </ThemedText>
            </View>
          ))}
        </View>
      </View>

      <View style={styles.bottomPadding} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 20,
  },
  shelf: {
    marginBottom: 40,
  },
  shelfBoard: {
    height: 8,
    backgroundColor: '#8B4513',
    borderRadius: 4,
    marginBottom: 4,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.2,
    shadowRadius: 2,
    elevation: 2,
  },
  booksRow: {
    flexDirection: 'row',
    height: 180,
    alignItems: 'flex-end',
  },
  bookSpine: {
    flex: 1,
    height: '100%',
    marginHorizontal: 1,
    paddingHorizontal: 4,
    paddingVertical: 8,
    justifyContent: 'space-between',
    backgroundColor: '#4A90E2',
    borderRadius: 2,
    borderLeftWidth: 2,
    borderLeftColor: '#357ABD',
  },
  bookTitle: {
    fontSize: 10,
    fontWeight: '600',
    color: '#FFFFFF',
    textAlign: 'center',
    writingDirection: 'ltr',
  },
  bookAuthor: {
    fontSize: 8,
    color: '#E6F3FF',
    textAlign: 'center',
    marginTop: 4,
  },
  bottomPadding: {
    height: 100, // 탭바 공간 확보
  },
});

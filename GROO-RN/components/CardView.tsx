import React from 'react';
import { View, ScrollView, StyleSheet, Dimensions } from 'react-native';
import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import { Book } from '@/types';

interface CardViewProps {
  books: Book[];
}

const { width } = Dimensions.get('window');
const cardWidth = (width - 60) / 2; // 2 columns with padding

export default function CardView({ books }: CardViewProps) {
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
    }
  ];

  const displayBooks = books.length > 0 ? books : sampleBooks;

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <View style={styles.grid}>
        {displayBooks.map((book, index) => (
          <ThemedView key={book.id} style={styles.card}>
            <View style={styles.bookCover}>
              <ThemedText style={styles.bookTitle} numberOfLines={2}>
                {book.title}
              </ThemedText>
            </View>
            <View style={styles.bookInfo}>
              <ThemedText style={styles.author} numberOfLines={1}>
                {book.authors}
              </ThemedText>
              <ThemedText style={styles.publisher} numberOfLines={1}>
                {book.publisher}
              </ThemedText>
            </View>
          </ThemedView>
        ))}
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 20,
  },
  grid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
    paddingBottom: 100, // 탭바 공간 확보
  },
  card: {
    width: cardWidth,
    marginBottom: 20,
    borderRadius: 12,
    overflow: 'hidden',
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  bookCover: {
    height: cardWidth * 1.4, // 책 비율에 맞게
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f0f0f0',
    padding: 10,
  },
  bookTitle: {
    fontSize: 14,
    fontWeight: '600',
    textAlign: 'center',
    color: '#333',
  },
  bookInfo: {
    padding: 12,
  },
  author: {
    fontSize: 12,
    fontWeight: '500',
    marginBottom: 4,
  },
  publisher: {
    fontSize: 11,
    opacity: 0.7,
  },
});

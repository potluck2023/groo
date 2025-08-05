import React, { useState, useEffect } from 'react';
import { StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import SearchInput from '@/components/SearchInput';
import SearchResults from '@/components/SearchResults';
import { Book } from '@/types';

export default function SearchScreen() {
  const [searchText, setSearchText] = useState('');
  const [searchResults, setSearchResults] = useState<Book[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const [hasSearched, setHasSearched] = useState(false);

  // 임시 검색 데이터 (실제로는 API 호출로 대체)
  const mockSearchData: Book[] = [
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
      title: '노르웨이의 숲',
      imageURL: '',
      authors: '무라카미 하루키',
      publisher: '문학사상',
      publicationYear: '1987',
      isbn: '9788970127248'
    },
    {
      id: '5',
      title: '데미안',
      imageURL: '',
      authors: '헤르만 헤세',
      publisher: '민음사',
      publicationYear: '1919',
      isbn: '9788937462788'
    }
  ];

  const handleSearch = () => {
    if (searchText.trim().length === 0) {
      return;
    }

    setIsLoading(true);
    setHasSearched(true);

    // 임시 검색 로직 (실제로는 API 호출)
    setTimeout(() => {
      const filteredResults = mockSearchData.filter(book => 
        book.title.toLowerCase().includes(searchText.toLowerCase()) ||
        book.authors.toLowerCase().includes(searchText.toLowerCase())
      );
      setSearchResults(filteredResults);
      setIsLoading(false);
    }, 1000);
  };

  const handleBookPress = (book: Book) => {
    console.log('Selected book:', book.title);
    // 나중에 책 상세 페이지로 네비게이션 구현
  };

  const renderInitialState = () => (
    <View style={styles.initialContainer}>
      <ThemedText style={styles.initialTitle}>도서 검색</ThemedText>
      <ThemedText style={styles.initialSubtitle}>
        찾고 싶은 도서의 제목이나 저자명을 입력해보세요
      </ThemedText>
    </View>
  );

  return (
    <ThemedView style={styles.container}>
      <View style={styles.header}>
        <SearchInput
          value={searchText}
          onChangeText={setSearchText}
          onSearch={handleSearch}
        />
      </View>
      
      <View style={styles.content}>
        {!hasSearched ? (
          renderInitialState()
        ) : (
          <SearchResults
            books={searchResults}
            onBookPress={handleBookPress}
            isLoading={isLoading}
          />
        )}
      </View>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 50,
  },
  content: {
    flex: 1,
  },
  initialContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 40,
  },
  initialTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 12,
  },
  initialSubtitle: {
    fontSize: 16,
    textAlign: 'center',
    opacity: 0.7,
    lineHeight: 24,
  },
});

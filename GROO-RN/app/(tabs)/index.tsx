import React, { useState } from 'react';
import { StyleSheet } from 'react-native';

import { ThemedView } from '@/components/ThemedView';
import ViewTypeSelector from '@/components/ViewTypeSelector';
import CardView from '@/components/CardView';
import BookshelfView from '@/components/BookshelfView';
import { HomeViewType, Book } from '@/types';

export default function HomeScreen() {
  const [viewType, setViewType] = useState<HomeViewType>(HomeViewType.CARD);
  const [books] = useState<Book[]>([]); // 나중에 실제 데이터로 교체

  return (
    <ThemedView style={styles.container}>
      <ViewTypeSelector 
        selectedType={viewType} 
        onTypeChange={setViewType} 
      />
      
      {viewType === HomeViewType.CARD ? (
        <CardView books={books} />
      ) : (
        <BookshelfView books={books} />
      )}
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});

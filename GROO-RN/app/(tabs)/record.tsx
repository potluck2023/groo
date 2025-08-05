import React, { useState } from 'react';
import { StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import RecordFilter from '@/components/RecordFilter';
import RecordList from '@/components/RecordList';
import { ReadingRecord, RecordFilterType } from '@/types';

export default function RecordScreen() {
  const [selectedFilter, setSelectedFilter] = useState<RecordFilterType>(RecordFilterType.ALL);
  const [records] = useState<ReadingRecord[]>([]);

  const handleAddRecord = () => {
    console.log('Add new record');
  };

  const handleRecordPress = (record: ReadingRecord) => {
    console.log('Record pressed:', record.bookTitle);
  };

  return (
    <ThemedView style={styles.container}>
      <View style={styles.header}>
        <ThemedText type="title" style={styles.title}>독서 기록</ThemedText>
        <ThemedText style={styles.subtitle}>생각 노트</ThemedText>
      </View>
      
      <RecordFilter 
        selectedFilter={selectedFilter}
        onFilterChange={setSelectedFilter}
      />
      
      <RecordList
        records={records}
        onRecordPress={handleRecordPress}
        onAddRecord={handleAddRecord}
      />
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    paddingTop: 50,
    paddingHorizontal: 20,
    paddingBottom: 10,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
  },
  subtitle: {
    fontSize: 16,
    opacity: 0.7,
    marginTop: 4,
  },
});

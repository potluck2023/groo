import React from 'react';
import { View, TouchableOpacity, StyleSheet } from 'react-native';
import { ThemedText } from '@/components/ThemedText';
import { Colors } from '@/constants/Colors';
import { useColorScheme } from '@/hooks/useColorScheme';
import { RecordFilterType } from '@/types';

interface RecordFilterProps {
  selectedFilter: RecordFilterType;
  onFilterChange: (filter: RecordFilterType) => void;
}

export default function RecordFilter({ selectedFilter, onFilterChange }: RecordFilterProps) {
  const colorScheme = useColorScheme();
  const colors = Colors[colorScheme ?? 'light'];

  const filterOptions = [
    { key: RecordFilterType.ALL, label: '전체' },
    { key: RecordFilterType.THIS_MONTH, label: '이번 달' },
    { key: RecordFilterType.THIS_YEAR, label: '올해' },
  ];

  return (
    <View style={styles.container}>
      {filterOptions.map((option) => (
        <TouchableOpacity
          key={option.key}
          style={[
            styles.filterButton,
            {
              backgroundColor: selectedFilter === option.key 
                ? colors.tint 
                : 'transparent',
              borderColor: colors.tint,
            }
          ]}
          onPress={() => onFilterChange(option.key)}
        >
          <ThemedText
            style={[
              styles.filterText,
              {
                color: selectedFilter === option.key 
                  ? '#FFFFFF' 
                  : colors.text,
              }
            ]}
          >
            {option.label}
          </ThemedText>
        </TouchableOpacity>
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    paddingHorizontal: 20,
    paddingVertical: 10,
    gap: 10,
  },
  filterButton: {
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: 20,
    borderWidth: 1,
  },
  filterText: {
    fontSize: 14,
    fontWeight: '500',
  },
});

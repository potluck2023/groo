import React from 'react';
import { View, TouchableOpacity, StyleSheet } from 'react-native';
import { IconSymbol } from '@/components/ui/IconSymbol';
import { ThemedText } from '@/components/ThemedText';
import { Colors } from '@/constants/Colors';
import { useColorScheme } from '@/hooks/useColorScheme';
import { HomeViewType } from '@/types';

interface ViewTypeSelectorProps {
  selectedType: HomeViewType;
  onTypeChange: (type: HomeViewType) => void;
}

export default function ViewTypeSelector({ selectedType, onTypeChange }: ViewTypeSelectorProps) {
  const colorScheme = useColorScheme();
  const colors = Colors[colorScheme ?? 'light'];

  return (
    <View style={styles.container}>
      <ThemedText type="title" style={styles.title}>GROO</ThemedText>
      <View style={styles.buttonContainer}>
        <TouchableOpacity
          style={[
            styles.button,
            selectedType === HomeViewType.CARD && { backgroundColor: colors.tint }
          ]}
          onPress={() => onTypeChange(HomeViewType.CARD)}
        >
          <IconSymbol 
            size={20} 
            name="rectangle.grid.2x2" 
            color={selectedType === HomeViewType.CARD ? '#FFFFFF' : colors.text}
          />
        </TouchableOpacity>
        
        <TouchableOpacity
          style={[
            styles.button,
            selectedType === HomeViewType.BOOKSHELF && { backgroundColor: colors.tint }
          ]}
          onPress={() => onTypeChange(HomeViewType.BOOKSHELF)}
        >
          <IconSymbol 
            size={20} 
            name="books.vertical" 
            color={selectedType === HomeViewType.BOOKSHELF ? '#FFFFFF' : colors.text}
          />
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingTop: 50,
    paddingBottom: 20,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
  },
  buttonContainer: {
    flexDirection: 'row',
    gap: 10,
  },
  button: {
    width: 40,
    height: 40,
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(0,0,0,0.1)',
  },
});

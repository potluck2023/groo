// Book 관련 타입 정의
export interface Book {
  id: string;
  title: string;
  imageURL: string;
  authors: string;
  publisher: string;
  publicationYear: string;
  isbn: string;
}

export interface BookList {
  totalCount: number;
  contents: Book[];
}

// 홈 화면 뷰 타입
export enum HomeViewType {
  CARD = 'card',
  BOOKSHELF = 'bookshelf'
}

// 탭바 타입
export enum MainTab {
  HOME = 'home',
  SEARCH = 'search',
  RECORD = 'record',
  USER = 'user'
}

// 독서 기록 타입
export interface ReadingRecord {
  id: string;
  bookTitle: string;
  author: string;
  content: string;
  rating?: number;
  createdAt: Date;
  updatedAt: Date;
}

// 기록 필터 타입
export enum RecordFilterType {
  ALL = 'all',
  THIS_MONTH = 'thisMonth',
  THIS_YEAR = 'thisYear'
}

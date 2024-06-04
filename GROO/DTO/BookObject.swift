//
//  BookObject.swift
//  GROO
//
//  Created by isabella joo on 6/3/24.
//

import Foundation

struct BookObject: Codable {
    let bookname: String
    let authors: String
    let publisher: String
    let publication_year: String
    let isbn13: String
    let vol: String
    let bookImageURL: String
    let bookDtlUrl: String
    let loan_count: String
}

extension BookObject {
    func toModel() -> Book {
        .init(
            title: bookname,
            imageURL: bookImageURL,
            authors: authors,
            publisher: publisher,
            publicationYear: publication_year,
            isbn: isbn13
        )
    }
}

struct BookListObject: Decodable {
    let numFound: Int
    let docs: [BookObject]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    enum ResponseKeys: String, CodingKey {
        case numFound, docs
    }
    
    enum DocKeys: String, CodingKey {
        case doc
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let responseContainer = try container.nestedContainer(keyedBy: ResponseKeys.self, forKey: .response)
        
        numFound = try responseContainer.decode(Int.self, forKey: .numFound)
        
        var docsContainer = try responseContainer.nestedUnkeyedContainer(forKey: .docs)
        var docsArray = [BookObject]()
        
        while !docsContainer.isAtEnd {
            let docContainer = try docsContainer.nestedContainer(keyedBy: DocKeys.self)
            let bookObject = try docContainer.decode(BookObject.self, forKey: .doc)
            docsArray.append(bookObject)
        }
        
        docs = docsArray
    }
    
    init(
        numFound: Int,
        docs: [BookObject]
    ) {
        self.numFound = numFound
        self.docs = docs
    }
}

#if DEBUG
extension BookObject {
    static var stub1: Self {
        .init(
            bookname: "무지개 물고기와 흰수염고래",
            authors: "마르쿠스 피스터 그림.글;지혜연 옮김",
            publisher: "시공주니어",
            publication_year: "1999",
            isbn13: "9788972599999",
            vol: "",
            bookImageURL: "https://bookthumb-phinf.pstatic.net/cover/001/766/00176634.jpg?type=m1&udate=20141122",
            bookDtlUrl: "https://data4library.kr/bookV?seq=1524922",
            loan_count: "84681"
        )
    }
    
    static var stub2: Self {
        .init(
            bookname: "칭찬은 고래도 춤추게 한다",
            authors: "켄 블랜차드 외지음;조천제 옮김",
            publisher: "북21",
            publication_year: "2003",
            isbn13: "9788950905507",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/39/58/cover/8950905507_3.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=283898",
            loan_count: "51185"
        )
    }
    
    static var stub3: Self {
        .init(
            bookname: "고래는 왜 바다로 갔을까",
            authors: "과학아이 글;윤정주 [공]그림",
            publisher: "창작과 비평사",
            publication_year: "2000",
            isbn13: "9788936445263",
            vol: "",
            bookImageURL: "https://bookthumb-phinf.pstatic.net/cover/001/729/00172974.jpg?type=m1&udate=20170801",
            bookDtlUrl: "https://data4library.kr/bookV?seq=1563462",
            loan_count: "50824"
        )
    }
    
    static var stub4: Self {
        .init(
            bookname: "고래를 그리는 아이 ",
            authors: "윤수천 글 ;이승현 그림",
            publisher: "시공사",
            publication_year: "2011",
            isbn13: "9788952761088",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/1146/85/cover/8952761081_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2480891",
            loan_count: "31847"
        )
    }
    
    static var stub5: Self {
        .init(
            bookname: "주머니 속의 고래",
            authors: "이금이 지음",
            publisher: "푸른책들",
            publication_year: "2006",
            isbn13: "9788957980958",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/86/8/cover/8957980954_2.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2091016",
            loan_count: "31844"
        )
    }
    
    static var stub6: Self {
        .init(
            bookname: "(새로운 문명의 시대) 신석기 마을의 고래 사냥 ",
            authors: "글: 정종숙;그림: 오승민",
            publisher: "한솔교육",
            publication_year: "2006",
            isbn13: "9788953539129",
            vol: "2",
            bookImageURL: "http://image.aladin.co.kr/product/85/83/cover/8953539129_2.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2083845",
            loan_count: "31029"
        )
    }
    
    static var stub7: Self {
        .init(
            bookname: "(아기 돌고래 상괭이의) 우리 바다 여행 :우리 바다에 사는 바다 동물 ",
            authors: "보리 글 ;조광현 그림",
            publisher: "보리",
            publication_year: "2019",
            isbn13: "9788984280618",
            vol: "",
            bookImageURL: "",
            bookDtlUrl: "https://data4library.kr/bookV?seq=161449",
            loan_count: "28671"
        )
    }
    
    static var stub8: Self {
        .init(
            bookname: "고래들의 노래",
            authors: "다이안 셀든 글;고진하 옮김",
            publisher: "비룡소",
            publication_year: "1996",
            isbn13: "9788949110325",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/1/2/cover/8949110326_2.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=331264",
            loan_count: "27216"
        )
    }
    
    static var stub9: Self {
        .init(
            bookname: "고래똥 향수 ",
            authors: "글·그림: 방정화",
            publisher: "한솔교육",
            publication_year: "2010",
            isbn13: "9788953559028",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/310/81/cover/8953559022_2.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2279586",
            loan_count: "24639"
        )
    }
    
    static var stub10: Self {
        .init(
            bookname: "고래빙수 ",
            authors: "글·그림: 문채빈",
            publisher: "미래엔",
            publication_year: "2020",
            isbn13: "9791164135752",
            vol: "",
            bookImageURL: "https://image.aladin.co.kr/product/24775/25/cover/k002631723_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=5730807",
            loan_count: "22884"
        )
    }
    
    static var stub11: Self {
        .init(
            bookname: "고래가 보고 싶거든 ",
            authors: "줄리 폴리아노 글 ;김경연 옮김",
            publisher: "문학동네",
            publication_year: "2014",
            isbn13: "9788954623896",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/3724/41/cover/8954623891_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2011330",
            loan_count: "20923"
        )
    }
    
    static var stub12: Self {
        .init(
            bookname: "바다 탐험대 옥토넛 :범고래 ",
            authors: "원저: 메오미 ;옮김: 전하제",
            publisher: "종이비행기",
            publication_year: "2015",
            isbn13: "9788967191498",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/5649/67/cover/8967191499_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2623049",
            loan_count: "20305"
        )
    }
    
    static var stub13: Self {
        .init(
            bookname: "바다 탐험대 옥토넛 :고래상어 ",
            authors: "원저: 메오미 ;옮김: 모윤희",
            publisher: "종이비행기",
            publication_year: "2015",
            isbn13: "9788967191436",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/5649/77/cover/896719143x_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2622995",
            loan_count: "19155"
        )
    }
    
    static var stub14: Self {
        .init(
            bookname: "꽃피는 고래 :김형경 장편소설 ",
            authors: "지은이: 김형경",
            publisher: "창비",
            publication_year: "2008",
            isbn13: "9788936433659",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/224/4/cover/8936433652_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2210157",
            loan_count: "19004"
        )
    }
    
    static var stub15: Self {
        .init(
            bookname: "귀신고래 :한국계 고래를 찾아서 ",
            authors: "김일광 지음 ;장호 그림",
            publisher: "내인생의책",
            publication_year: "2008",
            isbn13: "9788991813175",
            vol: "",
            bookImageURL: "https://bookthumb-phinf.pstatic.net/cover/043/885/04388564.jpg?type=m1&udate=20160801",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2187932",
            loan_count: "18029"
        )
    }
    
    static var stub16: Self {
        .init(
            bookname: "고래가 그물에 걸렸어요 ",
            authors: "글: 로버트 버레이 ;우리말 옮김: 이정모",
            publisher: "불광출판사",
            publication_year: "2015",
            isbn13: "9788974792671",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/6285/0/cover/8974792672_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2625486",
            loan_count: "18028"
        )
    }
    
    static var stub17: Self {
        .init(
            bookname: "고래를 따라갔어요",
            authors: "에바 무어 글;이강환 옮김",
            publisher: "비룡소",
            publication_year: "2001",
            isbn13: "9788949130590",
            vol: "3",
            bookImageURL: "http://image.aladin.co.kr/product/27/97/cover/8949130599_2.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2408217",
            loan_count: "17542"
        )
    }
    
    static var stub18: Self {
        .init(
            bookname: "고래가 포유동물이라고? ",
            authors: "캐롤라인 아놀드 글 ;윤소영 옮김",
            publisher: "시공사",
            publication_year: "2009",
            isbn13: "9788952755438",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/415/45/cover/895275543x_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=2308160",
            loan_count: "16890"
        )
    }
    
    static var stub19: Self {
        .init(
            bookname: "흰긴수염고래 ",
            authors: "제니 데스몬드 글·그림 ;이은파 옮김",
            publisher: "고래뱃속",
            publication_year: "2016",
            isbn13: "9788992505543",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/8169/49/cover/899250554x_1.jpg",
            bookDtlUrl: "https://data4library.kr/bookV?seq=3144296",
            loan_count: "16381"
        )
    }
    
    static var stub20: Self {
        .init(
            bookname: "(바다의 왕)고래",
            authors: "크리스티안 군치 글;윤소영 옮김",
            publisher: "시공사",
            publication_year: "2004",
            isbn13: "9788952724830",
            vol: "",
            bookImageURL: "http://image.aladin.co.kr/product/50/69/cover/8952724836_1.gif",
            bookDtlUrl: "https://data4library.kr/bookV?seq=363243",
            loan_count: "16091"
        )
    }
}

extension BookListObject {
    static var stub1: Self {
        .init(
            numFound: 10, 
            docs: [.stub1, .stub2, .stub3, .stub4, .stub5, .stub6, .stub7, .stub8, .stub9, .stub10]
        )
    }
    
    static var stub2: Self {
        .init(
            numFound: 10,
            docs: [.stub11, .stub12, .stub13, .stub14, .stub15, .stub16, .stub17, .stub18, .stub19, .stub20]
        )
    }
}
#endif

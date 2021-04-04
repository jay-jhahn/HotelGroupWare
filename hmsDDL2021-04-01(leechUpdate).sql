DROP TABLE dept_tbl;
DROP TABLE duty_tbl;
DROP TABLE level_tbl;
DROP TABLE emp_tbl;
DROP TABLE fam_tbl;
DROP TABLE guest_tbl;
DROP TABLE room_tbl;
DROP TABLE hall_tbl;
DROP TABLE board_tbl;
DROP TABLE welfare_tbl;
DROP TABLE res_tbl;
DROP TABLE mothlySale_tbl;
DROP TABLE busiLog_tbl;
DROP TABLE pmt_tbl;
DROP TABLE exchange_tbl;
DROP TABLE holiday_tbl;
DROP TABLE work_tbl;
DROP TABLE worktime_tbl;
DROP TABLE modifyScd_tbl;

---------------------------------------------------------------------------------------------------------------------------------------------------------
---부서 테이블---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dept_tbl (
	deptCode	VARCHAR2(20)	PRIMARY KEY,    -- 부서코드
	deptName	VARCHAR2(50)    -- 부서명              
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---직책 테이블---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE duty_tbl (
	dutyCode	VARCHAR2(20)	PRIMARY KEY,    -- 직책코드
	dutyName	VARCHAR2(20)    -- 직책명
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---직급 테이블---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE level_tbl (
	levelCode	VARCHAR2(20)	PRIMARY KEY,    -- 직급코드
	levelName	VARCHAR2(20)    -- 직급명		
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---직원 테이블---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE emp_tbl (
	empCode	        VARCHAR2(20)	PRIMARY KEY,    -- 직원코드
	levelCode	    VARCHAR2(20)	REFERENCES level_tbl(levelCode) ON DELETE CASCADE,  -- 직급코드
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- 부서코드
	dutyCode	    VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- 직책 코드
	empName	        VARCHAR2(20),   -- 직원명
	empEngName	    VARCHAR2(20),   -- 영문이름
	empChiName	    VARCHAR2(50),   -- 한문이름
	gender	        VARCHAR2(20),   -- 성별
	empPwd	        VARCHAR2(500),  -- 비밀번호
	empComPhone	    VARCHAR2(30),   -- 회사전화번호
	empHomePhone	VARCHAR2(30),   -- 집전화
	empPhone	    VARCHAR2(20),   -- 핸드폰
	empJumin	    VARCHAR2(20),   -- 주민번호
	empComEmail	    VARCHAR2(50),   -- 회사 이메일
	empEmail	    VARCHAR2(20),   -- 개인 이메일
	empAddr1	    VARCHAR2(20),   -- 우편번호
	empAddr2	    VARCHAR2(20),   -- 도로명주소
	empAddr3	    VARCHAR2(20),   -- 상세주소
	empKey	        VARCHAR2(30),   -- 이메일 인증 키
	empEnabled	    CHAR(1)         DEFAULT '0',    -- 사용가능 여부
	empAuthority	VARCHAR2(50)    DEFAULT 'ROLE_USER',    -- 권한
	empState	    CHAR(1)         DEFAULT '1',    -- 재직상태
	isMerried	    CHAR(1)         DEFAULT 'N',    -- 결혼여부
	weddingAnniv	TIMESTAMP,      -- 결혼기념일
	enterDate	    TIMESTAMP       DEFAULT sysdate,    -- 입사일
	resignDate	    TIMESTAMP,  -- 퇴사일
	empNotes	    VARCHAR2(1000), -- 비고
	payConStand	    CHAR(1)         DEFAULT '1',    -- 급여계약기준
	isProbation	    VARCHAR2(20)    DEFAULT 'N'     -- 수습여부
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---가족 테이블--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE fam_tbl (
	empCode	    VARCHAR2(20)  PRIMARY KEY,    -- 직원코드
	relation	VARCHAR2(30),   -- 관계
	faMemName	VARCHAR2(30),   -- 구성원 이름
	faMemAge	VARCHAR2(30),   -- 구성원 나이
	isLiveTogt	VARCHAR2(30)    -- 동거여부
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---회원 테이블---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE guest_tbl (
	guestCode	VARCHAR2(20)  PRIMARY KEY,    -- 고객코드
	guestName	VARCHAR2(20),   -- 고객명
	guestPhone	VARCHAR2(20),   -- 고객 연락처
	guestEmail	VARCHAR2(20),   -- 고객 이메일
	guestLevel	CHAR(1)         -- 고객 등급
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---객실 테이블---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE room_tbl (
   roomNum    VARCHAR2(20)  PRIMARY KEY,    -- 객실번호
   roomKind   VARCHAR2(30),   -- 객실 종류
   roomState  CHAR(1)       DEFAULT 0,      -- 객실 상태
   roomPrice  NUMBER          -- 이용가격
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---연회장 테이블-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE hall_tbl (
	hallCode	VARCHAR2(20)  PRIMARY KEY,    -- 연회장코드
	hallName	VARCHAR2(50),   -- 연회장명
	state	    CHAR(1),        -- 상태
	price	    NUMBER          -- 이용가격
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---예약내역 테이블-------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE res_tbl (
   resCode         VARCHAR2(20)  PRIMARY KEY,    -- 예약코드
   hallCode        VARCHAR2(20)  REFERENCES hall_tbl(hallCode) ON DELETE CASCADE,    -- 연회장 코드
   roomNum         VARCHAR2(20)  REFERENCES room_tbl(roomNum) ON DELETE CASCADE,     -- 객실번호
   empCode         VARCHAR2(20)  REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- 직원코드
   guestCode       VARCHAR2(20)  REFERENCES guest_tbl(guestCode) ON DELETE CASCADE,  -- 고객코드
   resCount        NUMBER,         -- 예약인원
   resDate         TIMESTAMP     DEFAULT sysdate,    -- 예약날짜
   checkIn         VARCHAR2(30),      -- 체크인시간(객실), 행사시작 시간(연회장)
   checkOut        VARCHAR2(30),      -- 체크아웃시간(객실), 행사끝나는 시간(연회장)
   eventTitle      VARCHAR2(100),  -- 행사명(연회장)
   eventDate       TIMESTAMP,      -- 행사일(연회장)
   eventMenu       VARCHAR2(50),   -- 연회장 음식 메뉴
   eventTableSet   VARCHAR2(1000), -- 연회장 테이블 셋팅
   eventNotes      VARCHAR2(1000), -- 기타사항
   eventCake       VARCHAR2(1000), -- 데코레이션 케이크(연회장)
   eventFlower     VARCHAR2(100),  -- 플라워(연회장)
   resKind         CHAR(1)       NOT NULL,   -- 종류(객실/연회장)
   resState        CHAR(1)       DEFAULT 0   -- 예약상태
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---게시판 테이블-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE board_tbl (
	boardNo 	    NUMBER          PRIMARY KEY,    -- 게시판 번호
	empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- 직원코드
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- 부서코드
	dutyCode	    VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- 직책코드
	boardPwd	    VARCHAR2(20),   -- 게시판 비밀번호(비밀글)
	boardTitle	    VARCHAR2(100),  -- 게시판 제목
	boardContent	VARCHAR2(1000), -- 내용
	boardFile1	    VARCHAR2(1000), -- 게시글 파일1
	boardFile2	    VARCHAR2(1000), -- 게시글 파일2
	readCnt	        NUMBER,         -- 조회수
	writeDate	    TIMESTAMP       DEFAULT sysdate,      -- 작성일
	updateDate	    TIMESTAMP       -- 수정일
);


---------------------------------------------------------------------------------------------------------------------------------------------------------
---직원상품 테이블-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE welfare_tbl (
	welfareCode	    VARCHAR2(20)	PRIMARY KEY,    -- 직원상품코드
	empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,  -- 사원번호
	prodName	    VARCHAR2(100)   NOT NULL,   -- 상품명
	realPrice	    NUMBER          NOT NULL,   -- 원가
	dcPrice	        NUMBER          NOT NULL,   -- 할인가
	prodContents	VARCHAR2(4000)  NOT NULL,   -- 상품설명
	prodImg1	    VARCHAR2(1000)  NOT NULL,   -- 상품이미지
	prodImg2	    VARCHAR2(1000)              -- 상품이미지2
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---결산 테이블---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE mothlySale_tbl (
   accountCode  NUMBER        PRIMARY KEY,    -- 결산코드
   resCode      VARCHAR2(20)  REFERENCES res_tbl(resCode) ON DELETE CASCADE,      -- 예약코드
   hallCode     VARCHAR2(20)  REFERENCES hall_tbl(hallCode) ON DELETE CASCADE,    -- 연회장코드
   roomNum      VARCHAR2(20)  REFERENCES room_tbl(roomNum) ON DELETE CASCADE,     -- 객실번호
   totalSale    VARCHAR2(20)  DEFAULT '0',-- 총매출
   loss         VARCHAR2(20)  DEFAULT '0',   -- 손실
   netProfit    VARCHAR2(20)  DEFAULT '0',   -- 순이익
   year         VARCHAR2(20)  DEFAULT '1',   -- 연
   month        VARCHAR2(20)  DEFAULT '1',   -- 월
   day          VARCHAR2(20)  DEFAULT '1'    -- 일
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---업무일지 테이블-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE busiLog_tbl (
    recordCode       VARCHAR2(20)   PRIMARY KEY,    -- 업무일지 코드
    empCode           VARCHAR2(20)   REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- 직원코드
    deptCode       VARCHAR2(20)   REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- 부서코드
    dutyCode       VARCHAR2(20)   REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- 직책코드
    writeDate       TIMESTAMP       DEFAULT sysdate,      -- 작성일
    sales_dis       VARCHAR2(3000)  DEFAULT '내용없음',  -- 객실 종류별 판매실적
    week_res_dis    VARCHAR2(3000)  DEFAULT '내용없음',  -- 일주일간 예약현황
    ori_dis         VARCHAR2(3000)  DEFAULT '내용없음',  -- 단체객 현황
    vip_dis         VARCHAR2(3000)  DEFAULT '내용없음',  -- vip 현황
    price_dis       VARCHAR2(3000)  DEFAULT '내용없음',  -- 특별요금 적용 현황
    res_dis         VARCHAR2(3000)  DEFAULT '내용없음',  -- 예약자 명단
    unique_dis      VARCHAR2(3000)  DEFAULT '내용없음'   -- 특이사항
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---급여명세서 테이블----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE pmt_tbl (
	pmtCode	        NUMBER          PRIMARY KEY,    -- 명세코드
	empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- 사원번호
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- 부서코드
	dutyCode	    VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- 직책코드
	salary	        NUMBER          NOT NULL,   -- 급여
	extension	    NUMBER,     -- 연장수당
	holiday	        NUMBER,     -- 휴일수당
	bonus	        NUMBER,     -- 상여금
	meals	        NUMBER,     -- 식대
	selfDrive	    NUMBER,     -- 자가운전보조금
	welfare	        NUMBER,     -- 출산/보육수당
	etc	            NUMBER,     -- 기타수당
	taxPmt	        NUMBER      NOT NULL,       -- 과세지급계
	nonTaxPmt	    NUMBER,                     -- 비과세지급계
	totalPmt	    NUMBER      NOT NULL,       -- 지급합계
	incTx	        NUMBER      DEFAULT 41630,  -- 소득세
	rsdtTx	        NUMBER      DEFAULT 4163,   -- 주민세
	employmentIns	NUMBER      NOT NULL,       -- 고용보험
	nationalPension	NUMBER      NOT NULL,       -- 국민연금
	longCareIns	    NUMBER,                     -- 장기요양
	healthIns	    NUMBER      NOT NULL,       -- 건강보험
	totalDeduct	    NUMBER      NOT NULL,       -- 공제합계
	ddctAmount	    NUMBER      NOT NULL,       -- 차감수령액
	pmtDate	        TIMESTAMP   DEFAULT sysdate -- 지급일자
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---환전 테이블--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE exchange_tbl (
	exCode	        VARCHAR2(20)    PRIMARY KEY,    -- 환전코드
	guestCode	    VARCHAR2(20)	REFERENCES guest_tbl(guestCode) ON DELETE CASCADE,  -- 고객코드
    country         VARCHAR2(100),  -- 나라
	currency	    NUMBER          DEFAULT 0,    -- 나라별 통화
	exMoney 	    NUMBER          DEFAULT 0,            -- 환전금액
	exTime	        TIMESTAMP       DEFAULT sysdate,      -- 환전시간
	exTotal	        NUMBER          DEFAULT 0,            -- 총 환전금액(일)
	holding	        NUMBER          DEFAULT 0             -- 보유금액
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---근무 테이블--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE work_tbl (
	scdCode	    NUMBER          PRIMARY KEY,    -- 스케줄 코드 
	empCode	    VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,        -- 직원코드
	deptCode	VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,      -- 부서코드  
	scdMonth	NUMBER,         -- 근무 월
	scdWork	    VARCHAR2(50),         -- 근무/휴무 일 
	remark	    VARCHAR2(500)   -- 비고
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---휴가 테이블--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE holiday_tbl (
	holidayCode	        NUMBER          PRIMARY KEY,    -- 휴가코드
	scdCode	            NUMBER      	REFERENCES work_tbl(scdCode) ON DELETE CASCADE,        -- 스케줄 코드
	empCode	            VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,         -- 직원코드
	deptCode	        VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,       -- 부서코드
	kindHoliday	        NUMBER,         -- 휴무 종류
	startHoliday	    TIMESTAMP       DEFAULT sysdate,      -- 휴무 시작 일
	endHoliday	        TIMESTAMP       DEFAULT sysdate,      -- 휴무 종료 일    
	reasonHoliday	    VARCHAR2(500),  -- 휴무 사유
	state	            CHAR(1)         DEFAULT '0',    -- 휴무 상태
	availableHoliday	NUMBER          DEFAULT 15,     -- 발생일 수
	remainHoliday	    NUMBER          DEFAULT 15,     -- 잔여일 수    
	usedHoliday	        NUMBER          DEFAULT 0       -- 사용일 수
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---근태 테이블--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE worktime_tbl (
	worktimeCode	VARCHAR2(20)	PRIMARY KEY,    -- 근무시간 코드
    empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- 직원코드
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- 부서코드  
	startWork	    TIMESTAMP       DEFAULT sysdate,  -- 근무시작 시간
	endWork	        TIMESTAMP       DEFAULT sysdate   -- 근무끝난 시간		    
);


---------------------------------------------------------------------------------------------------------------------------------------------------------
------- 근무 변경 신청 테이블 생성(2021.04.01) --------------------------------------------------------------------------------------------------------------- 
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE modifyScd_tbl (
	modfiyWorkCode	   NUMBER PRIMARY KEY,                                             -- 근무 변경
    scdCode	           NUMBER REFERENCES work_tbl(scdCode) ON DELETE CASCADE,          -- 스케줄 코드                                          
	empCode	           VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,     -- 사원번호
	deptCode	       VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,   -- 부서코드
	modifyDate	       TIMESTAMP default sysdate,  -- 변경 일    
	state	           CHAR(1)	default 0,         -- 문서상태 코드
	remark	           VARCHAR2(500) default '',   -- 비고
	modifyType	       CHAR(1)	default 0,         -- 변경 근무 타입 
    reqModifyDate	   TIMESTAMP default sysdate   -- 근무 변경 신청 일
);






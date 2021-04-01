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

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�μ� ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dept_tbl (
	deptCode	VARCHAR2(20)	PRIMARY KEY,    -- �μ��ڵ�
	deptName	VARCHAR2(50)    -- �μ���              
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---��å ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE duty_tbl (
	dutyCode	VARCHAR2(20)	PRIMARY KEY,    -- ��å�ڵ�
	dutyName	VARCHAR2(20)    -- ��å��
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---���� ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE level_tbl (
	levelCode	NUMBER	PRIMARY KEY,    -- �����ڵ�
	levelName	VARCHAR2(20)    -- ������		
);

DROP SEQUENCE level_seq;

CREATE SEQUENCE level_seq 
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99;

---------------------------------------------------------------------------------------------------------------------------------------------------------
---���� ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE emp_tbl (
	empCode	        VARCHAR2(20)	PRIMARY KEY,    -- �����ȣ
	levelCode	    NUMBER	        REFERENCES level_tbl(levelCode) ON DELETE CASCADE,  -- �����ڵ�
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�
	dutyCode	    VARCHAR2(20)	DEFAULT '-' REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- ��å�ڵ�
	empPwd	        VARCHAR2(500),  -- ��й�ȣ
    empName	        VARCHAR2(50)    NOT NULL,   -- ������
	empJumin	    VARCHAR2(20)    NOT NULL,   -- �ֹι�ȣ
    gender	        VARCHAR2(20),   -- ����
	empBirth        VARCHAR2(50)    NOT NULL,   -- �������
    solarOrLunar    VARCHAR2(10),   -- ���/����
	empHomePhone	VARCHAR2(50),   -- ����ȭ
	empPhone	    VARCHAR2(50)    NOT NULL,   -- �ڵ���
	empEmail	    VARCHAR2(100)   NOT NULL,  -- ���� �̸���
	postCode	    VARCHAR2(20)    NOT NULL,   -- ������ȣ
	roadAddress	    VARCHAR2(100)   NOT NULL,  -- ���θ��ּ�
	jibunAddress    VARCHAR2(100),  -- �����ּ�
    detailAddress   VARCHAR2(100)   NOT NULL,  -- ���ּ�
    extraAddress    VARCHAR2(50),   -- �����׸�	
	payConStand	    VARCHAR2(50)    DEFAULT '������',     -- �޿�������
	isProbation	    CHAR(1)         DEFAULT 'N',     -- ��������
    rate            NUMBER,         -- �����
    empState	    CHAR(1)         DEFAULT '1',     -- ��������
	enterDate	    VARCHAR2(50)    NOT NULL,   -- �Ի���
	resignDate	    VARCHAR2(50)    DEFAULT '--',   -- �����
    empNotes	    VARCHAR2(1000), -- ���
	empKey	        VARCHAR2(30),   -- �̸��� ���� Ű �ȽἭ ���￹��!!
	empEnabled	    CHAR(1)         DEFAULT '0',         -- ��밡�� ����
	empAuthority	VARCHAR2(50)    DEFAULT 'ROLE_USER',  -- ����	
    empImg          VARCHAR2(1000)  -- ��������
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---���� ���̺�--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE fam_tbl (
	empCode	    VARCHAR2(20)  PRIMARY KEY,    -- �����ڵ�
	relation	VARCHAR2(30),   -- ����
	faMemName	VARCHAR2(30),   -- ������ �̸�
	faMemAge	VARCHAR2(30),   -- ������ ����
	isLiveTogt	VARCHAR2(30)    -- ���ſ���
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---ȸ�� ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE guest_tbl (
	guestCode	VARCHAR2(20)  PRIMARY KEY,    -- �����ڵ�
	guestName	VARCHAR2(20),   -- ������
	guestPhone	VARCHAR2(20),   -- ���� ����ó
	guestEmail	VARCHAR2(20),   -- ���� �̸���
	guestLevel	CHAR(1)         -- ���� ���
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---���� ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE room_tbl (
   roomNum    VARCHAR2(20)  PRIMARY KEY,    -- ���ǹ�ȣ
   roomKind   VARCHAR2(30),   -- ���� ����
   roomState  CHAR(1)       DEFAULT 0,      -- ���� ����
   roomPrice  NUMBER          -- �̿밡��
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---��ȸ�� ���̺�-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE hall_tbl (
	hallCode	VARCHAR2(20)  PRIMARY KEY,    -- ��ȸ���ڵ�
	hallName	VARCHAR2(50),   -- ��ȸ���
	state	    CHAR(1),        -- ����
	price	    NUMBER          -- �̿밡��
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---���೻�� ���̺�-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE res_tbl (
   resCode         VARCHAR2(20)  PRIMARY KEY,    -- �����ڵ�
   hallCode        VARCHAR2(20)  REFERENCES hall_tbl(hallCode) ON DELETE CASCADE ,    -- ��ȸ�� �ڵ�
   roomNum         VARCHAR2(20)  default 0 REFERENCES room_tbl(roomNum) ON DELETE CASCADE,     -- ���ǹ�ȣ
   empCode         VARCHAR2(20)  REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ڵ�
   guestCode       VARCHAR2(20)  REFERENCES guest_tbl(guestCode) ON DELETE CASCADE,  -- �����ڵ�
   resCount        VARCHAR2(1000), -- �����ο�
   resDate         TIMESTAMP     DEFAULT sysdate,    -- ���೯¥
   eventTitle      VARCHAR2(100),  -- ����(��ȸ��)
   eventDate       TIMESTAMP,      -- �����(��ȸ��)
   eventMenu       VARCHAR2(50),   -- ��ȸ�� ���� �޴�
   eventTableSet   VARCHAR2(1000), -- ��ȸ�� ���̺� ����
   eventNotes      VARCHAR2(1000), -- ��Ÿ����
   eventCake       VARCHAR2(1000), -- ���ڷ��̼� ����ũ(��ȸ��)
   eventFlower     VARCHAR2(100),  -- �ö��(��ȸ��)
   resKind         CHAR(1)       NOT NULL,   -- ����(����/��ȸ��)
   resState        CHAR(1)       DEFAULT 0,   -- �������
   eventSahang     VARCHAR2(1000), -- Ư�����
   eventIce        VARCHAR2(1000),    -- ���̽�ī��
   eventMist       VARCHAR2(1000),   -- �̺�Ʈ �ӽ�
   checkIn         VARCHAR2(200),  -- üũ�νð�(����), ������ �ð�(��ȸ��)
   eventMenu1      VARCHAR2(200),   -- �޴� ��
   guestPhone      VARCHAR2(50)  ,  -- ���� �ڵ��� 
   checkOut        VARCHAR2(200),   -- üũ�ƿ��ð�(����), ������ �ð�(��ȸ��)
   guestName       VARCHAR2(200)     -- �����̸�
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�Խ��� ���̺�-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE board_tbl (
   boardNo        NUMBER         PRIMARY KEY,    -- �Խ��� ��ȣ
   empCode        VARCHAR2(20)   REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ڵ�
   deptCode       VARCHAR2(20)   REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�
   dutyCode       VARCHAR2(20)   REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- ��å�ڵ�
   boardPwd       VARCHAR2(20),   -- �Խ��� ��й�ȣ(��б�)
   boardTitle     VARCHAR2(100),  -- �Խ��� ����
   boardContent   VARCHAR2(1000), -- ����
   boardFile1     VARCHAR2(1000), -- �Խñ� ����1
   boardFile2     VARCHAR2(1000), -- �Խñ� ����2
   readCnt        NUMBER,         -- ��ȸ��
   writeDate      TIMESTAMP      DEFAULT sysdate,      -- �ۼ���
   updateDate     TIMESTAMP,       -- ������
   boardState     NUMBER(1)      DEFAULT 0     -- ����
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---������ǰ ���̺�-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE welfare_tbl (
   welfareCode     VARCHAR2(20)   PRIMARY KEY,    -- ������ǰ�ڵ�
   empCode         VARCHAR2(20)   REFERENCES emp_tbl(empCode) ON DELETE CASCADE,  -- �����ȣ
   prodName        VARCHAR2(100),              -- ��ǰ��
   realPrice       NUMBER          NOT NULL,   -- ����
   dcPrice         NUMBER          NOT NULL,   -- ���ΰ�
   roomKind        VARCHAR2(30),               -- ��������
   isBreakfast     NUMBER          DEFAULT 1,  -- ���Ŀ���
   prodContents1   VARCHAR2(3000)  NOT NULL,   -- �󼼳���1
   prodContents2   VARCHAR2(2000),             -- �󼼳���2
   prodContents3   VARCHAR2(2000),             -- �󼼳���3
   prodImg         VARCHAR2(1000)  NOT NULL    -- ��ǰ�̹���
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---��� ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE mothlySale_tbl (
   accountCode  NUMBER        PRIMARY KEY,    -- ����ڵ�
   resCode      VARCHAR2(20)  REFERENCES res_tbl(resCode) ON DELETE CASCADE,      -- �����ڵ�
   hallCode     VARCHAR2(20)  REFERENCES hall_tbl(hallCode) ON DELETE CASCADE,    -- ��ȸ���ڵ�
   roomNum      VARCHAR2(20)  REFERENCES room_tbl(roomNum) ON DELETE CASCADE,     -- ���ǹ�ȣ
   totalSale    VARCHAR2(20)  DEFAULT '0',-- �Ѹ���
   loss         VARCHAR2(20)  DEFAULT '0',   -- �ս�
   netProfit    VARCHAR2(20)  DEFAULT '0',   -- ������
   year         VARCHAR2(20)  DEFAULT '1',   -- ��
   month        VARCHAR2(20)  DEFAULT '1',   -- ��
   day          VARCHAR2(20)  DEFAULT '1'    -- ��
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�������� ���̺�-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE busiLog_tbl (
   recordCode      VARCHAR2(20)   PRIMARY KEY,    -- �������� �ڵ�
   empCode         VARCHAR2(20)   REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ڵ�
   deptCode        VARCHAR2(20)   REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�
   dutyCode        VARCHAR2(20)   REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- ��å�ڵ�
   writeDate       TIMESTAMP       DEFAULT sysdate,      -- �ۼ���
   sales_dis       VARCHAR2(3000)  DEFAULT '�������',  -- ���� ������ �ǸŽ���
   week_res_dis    VARCHAR2(3000)  DEFAULT '�������',  -- �����ϰ� ������Ȳ
   ori_dis         VARCHAR2(3000)  DEFAULT '�������',  -- ��ü�� ��Ȳ
   vip_dis         VARCHAR2(3000)  DEFAULT '�������',  -- vip ��Ȳ
   price_dis       VARCHAR2(3000)  DEFAULT '�������',  -- Ư����� ���� ��Ȳ
   res_dis         VARCHAR2(3000)  DEFAULT '�������',  -- ������ ����
   unique_dis      VARCHAR2(3000)  DEFAULT '�������'   -- Ư�̻���
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�޿������� ���̺�----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE pmt_tbl (
	pmtCode	        NUMBER          PRIMARY KEY,    -- �����ڵ�
	empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ȣ
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�
	dutyCode	    VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- ��å�ڵ�
	salary	        NUMBER          NOT NULL,   -- �޿�
	extension	    NUMBER,     -- �������
	holiday	        NUMBER,     -- ���ϼ���
	bonus	        NUMBER,     -- �󿩱�
	meals	        NUMBER,     -- �Ĵ�
	selfDrive	    NUMBER,     -- �ڰ�����������
	welfare	        NUMBER,     -- ���/��������
	etc	            NUMBER,     -- ��Ÿ����
	taxPmt	        NUMBER      NOT NULL,       -- �������ް�
	nonTaxPmt	    NUMBER,                     -- ��������ް�
	totalPmt	    NUMBER      NOT NULL,       -- �����հ�
	incTx	        NUMBER      DEFAULT 41630,  -- �ҵ漼
	rsdtTx	        NUMBER      DEFAULT 4163,   -- �ֹμ�
	employmentIns	NUMBER      NOT NULL,       -- ���뺸��
	nationalPension	NUMBER      NOT NULL,       -- ���ο���
	longCareIns	    NUMBER,                     -- �����
	healthIns	    NUMBER      NOT NULL,       -- �ǰ�����
	totalDeduct	    NUMBER      NOT NULL,       -- �����հ�
	ddctAmount	    NUMBER      NOT NULL,       -- �������ɾ�
	pmtDate	        TIMESTAMP   DEFAULT sysdate -- ��������
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---ȯ�� ���̺�--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE exchange_tbl (
	exCode	        VARCHAR2(20)    PRIMARY KEY,    -- ȯ���ڵ�
	guestCode	    VARCHAR2(20)	REFERENCES guest_tbl(guestCode) ON DELETE CASCADE,  -- �����ڵ�
    country         VARCHAR2(100),  -- ����
	currency	    NUMBER          DEFAULT 0,    -- ���� ��ȭ
	exMoney 	    NUMBER          DEFAULT 0,            -- ȯ���ݾ�
	exTime	        TIMESTAMP       DEFAULT sysdate,      -- ȯ���ð�
	exTotal	        NUMBER          DEFAULT 0,            -- �� ȯ���ݾ�(��)
	holding	        NUMBER          DEFAULT 0             -- �����ݾ�
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�ٹ� ���̺�--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE work_tbl (
	scdCode	    NUMBER          PRIMARY KEY,    -- ������ �ڵ� 
	empCode	    VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,        -- �����ڵ�
	levelCode	NUMBER      	REFERENCES level_tbl(levelCode) ON DELETE CASCADE,    -- �����ڵ� 
	deptCode	VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,      -- �μ��ڵ�  
	dutyCode	VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,      -- ��å�ڵ�  
	scdMonth	NUMBER,         -- �ٹ� ��
	scdWork	    NUMBER,         -- �ٹ�/�޹� �� 
	remark	    VARCHAR2(500)   -- ���
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�ް� ���̺�--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE holiday_tbl (
	holidayCode	        NUMBER          PRIMARY KEY,    -- �ް��ڵ�
	scdCode	            NUMBER      	REFERENCES work_tbl(scdCode) ON DELETE CASCADE,        -- ������ �ڵ�
	empCode	            VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,         -- �����ڵ�
	levelCode	        NUMBER          REFERENCES level_tbl(levelCode) ON DELETE CASCADE,     -- �����ڵ�
	deptCode	        VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,       -- �μ��ڵ�
	dutyCode	        VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,       -- ��å�ڵ�
	kindHoliday	        NUMBER,         -- �޹� ����
	startHoliday	    TIMESTAMP       DEFAULT sysdate,      -- �޹� ���� ��
	endHoliday	        TIMESTAMP       DEFAULT sysdate,      -- �޹� ���� ��    
	reasonHoliday	    VARCHAR2(500),  -- �޹� ����
	state	            CHAR(1)         DEFAULT '0',      -- �޹� ����
	availableHoliday	NUMBER          DEFAULT 15,     -- �߻��� ��
	remainHoliday	    NUMBER          DEFAULT 15,     -- �ܿ��� ��    
	usedHoliday	        NUMBER          DEFAULT 0       -- ����� ��
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---���� ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE worktime_tbl (
	worktimeCode	VARCHAR2(20)	PRIMARY KEY,    -- �ٹ��ð� �ڵ�
    empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ڵ�
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�  
	dutyCode	    VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- ��å�ڵ�
	startWork	    TIMESTAMP       DEFAULT sysdate,  -- �ٹ����� �ð�
	endWork	        TIMESTAMP       DEFAULT sysdate   -- �ٹ����� �ð�		    
);
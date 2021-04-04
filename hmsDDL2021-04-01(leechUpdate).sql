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
	levelCode	VARCHAR2(20)	PRIMARY KEY,    -- �����ڵ�
	levelName	VARCHAR2(20)    -- ���޸�		
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---���� ���̺�---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE emp_tbl (
	empCode	        VARCHAR2(20)	PRIMARY KEY,    -- �����ڵ�
	levelCode	    VARCHAR2(20)	REFERENCES level_tbl(levelCode) ON DELETE CASCADE,  -- �����ڵ�
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�
	dutyCode	    VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- ��å �ڵ�
	empName	        VARCHAR2(20),   -- ������
	empEngName	    VARCHAR2(20),   -- �����̸�
	empChiName	    VARCHAR2(50),   -- �ѹ��̸�
	gender	        VARCHAR2(20),   -- ����
	empPwd	        VARCHAR2(500),  -- ��й�ȣ
	empComPhone	    VARCHAR2(30),   -- ȸ����ȭ��ȣ
	empHomePhone	VARCHAR2(30),   -- ����ȭ
	empPhone	    VARCHAR2(20),   -- �ڵ���
	empJumin	    VARCHAR2(20),   -- �ֹι�ȣ
	empComEmail	    VARCHAR2(50),   -- ȸ�� �̸���
	empEmail	    VARCHAR2(20),   -- ���� �̸���
	empAddr1	    VARCHAR2(20),   -- �����ȣ
	empAddr2	    VARCHAR2(20),   -- ���θ��ּ�
	empAddr3	    VARCHAR2(20),   -- ���ּ�
	empKey	        VARCHAR2(30),   -- �̸��� ���� Ű
	empEnabled	    CHAR(1)         DEFAULT '0',    -- ��밡�� ����
	empAuthority	VARCHAR2(50)    DEFAULT 'ROLE_USER',    -- ����
	empState	    CHAR(1)         DEFAULT '1',    -- ��������
	isMerried	    CHAR(1)         DEFAULT 'N',    -- ��ȥ����
	weddingAnniv	TIMESTAMP,      -- ��ȥ�����
	enterDate	    TIMESTAMP       DEFAULT sysdate,    -- �Ի���
	resignDate	    TIMESTAMP,  -- �����
	empNotes	    VARCHAR2(1000), -- ���
	payConStand	    CHAR(1)         DEFAULT '1',    -- �޿�������
	isProbation	    VARCHAR2(20)    DEFAULT 'N'     -- ��������
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
	guestCode	VARCHAR2(20)  PRIMARY KEY,    -- ���ڵ�
	guestName	VARCHAR2(20),   -- ����
	guestPhone	VARCHAR2(20),   -- �� ����ó
	guestEmail	VARCHAR2(20),   -- �� �̸���
	guestLevel	CHAR(1)         -- �� ���
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
---���೻�� ���̺�-------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE res_tbl (
   resCode         VARCHAR2(20)  PRIMARY KEY,    -- �����ڵ�
   hallCode        VARCHAR2(20)  REFERENCES hall_tbl(hallCode) ON DELETE CASCADE,    -- ��ȸ�� �ڵ�
   roomNum         VARCHAR2(20)  REFERENCES room_tbl(roomNum) ON DELETE CASCADE,     -- ���ǹ�ȣ
   empCode         VARCHAR2(20)  REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ڵ�
   guestCode       VARCHAR2(20)  REFERENCES guest_tbl(guestCode) ON DELETE CASCADE,  -- ���ڵ�
   resCount        NUMBER,         -- �����ο�
   resDate         TIMESTAMP     DEFAULT sysdate,    -- ���೯¥
   checkIn         VARCHAR2(30),      -- üũ�νð�(����), ������ �ð�(��ȸ��)
   checkOut        VARCHAR2(30),      -- üũ�ƿ��ð�(����), ��糡���� �ð�(��ȸ��)
   eventTitle      VARCHAR2(100),  -- ����(��ȸ��)
   eventDate       TIMESTAMP,      -- �����(��ȸ��)
   eventMenu       VARCHAR2(50),   -- ��ȸ�� ���� �޴�
   eventTableSet   VARCHAR2(1000), -- ��ȸ�� ���̺� ����
   eventNotes      VARCHAR2(1000), -- ��Ÿ����
   eventCake       VARCHAR2(1000), -- ���ڷ��̼� ����ũ(��ȸ��)
   eventFlower     VARCHAR2(100),  -- �ö��(��ȸ��)
   resKind         CHAR(1)       NOT NULL,   -- ����(����/��ȸ��)
   resState        CHAR(1)       DEFAULT 0   -- �������
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�Խ��� ���̺�-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE board_tbl (
	boardNo 	    NUMBER          PRIMARY KEY,    -- �Խ��� ��ȣ
	empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ڵ�
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�
	dutyCode	    VARCHAR2(20)	REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- ��å�ڵ�
	boardPwd	    VARCHAR2(20),   -- �Խ��� ��й�ȣ(��б�)
	boardTitle	    VARCHAR2(100),  -- �Խ��� ����
	boardContent	VARCHAR2(1000), -- ����
	boardFile1	    VARCHAR2(1000), -- �Խñ� ����1
	boardFile2	    VARCHAR2(1000), -- �Խñ� ����2
	readCnt	        NUMBER,         -- ��ȸ��
	writeDate	    TIMESTAMP       DEFAULT sysdate,      -- �ۼ���
	updateDate	    TIMESTAMP       -- ������
);


---------------------------------------------------------------------------------------------------------------------------------------------------------
---������ǰ ���̺�-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE welfare_tbl (
	welfareCode	    VARCHAR2(20)	PRIMARY KEY,    -- ������ǰ�ڵ�
	empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,  -- �����ȣ
	prodName	    VARCHAR2(100)   NOT NULL,   -- ��ǰ��
	realPrice	    NUMBER          NOT NULL,   -- ����
	dcPrice	        NUMBER          NOT NULL,   -- ���ΰ�
	prodContents	VARCHAR2(4000)  NOT NULL,   -- ��ǰ����
	prodImg1	    VARCHAR2(1000)  NOT NULL,   -- ��ǰ�̹���
	prodImg2	    VARCHAR2(1000)              -- ��ǰ�̹���2
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
    recordCode       VARCHAR2(20)   PRIMARY KEY,    -- �������� �ڵ�
    empCode           VARCHAR2(20)   REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ڵ�
    deptCode       VARCHAR2(20)   REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�
    dutyCode       VARCHAR2(20)   REFERENCES duty_tbl(dutyCode) ON DELETE CASCADE,    -- ��å�ڵ�
    writeDate       TIMESTAMP       DEFAULT sysdate,      -- �ۼ���
    sales_dis       VARCHAR2(3000)  DEFAULT '�������',  -- ���� ������ �ǸŽ���
    week_res_dis    VARCHAR2(3000)  DEFAULT '�������',  -- �����ϰ� ������Ȳ
    ori_dis         VARCHAR2(3000)  DEFAULT '�������',  -- ��ü�� ��Ȳ
    vip_dis         VARCHAR2(3000)  DEFAULT '�������',  -- vip ��Ȳ
    price_dis       VARCHAR2(3000)  DEFAULT '�������',  -- Ư����� ���� ��Ȳ
    res_dis         VARCHAR2(3000)  DEFAULT '�������',  -- ������ ���
    unique_dis      VARCHAR2(3000)  DEFAULT '�������'   -- Ư�̻���
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�޿����� ���̺�----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE pmt_tbl (
	pmtCode	        NUMBER          PRIMARY KEY,    -- ���ڵ�
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
	employmentIns	NUMBER      NOT NULL,       -- ��뺸��
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
	guestCode	    VARCHAR2(20)	REFERENCES guest_tbl(guestCode) ON DELETE CASCADE,  -- ���ڵ�
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
	deptCode	VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,      -- �μ��ڵ�  
	scdMonth	NUMBER,         -- �ٹ� ��
	scdWork	    VARCHAR2(50),         -- �ٹ�/�޹� �� 
	remark	    VARCHAR2(500)   -- ���
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---�ް� ���̺�--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE holiday_tbl (
	holidayCode	        NUMBER          PRIMARY KEY,    -- �ް��ڵ�
	scdCode	            NUMBER      	REFERENCES work_tbl(scdCode) ON DELETE CASCADE,        -- ������ �ڵ�
	empCode	            VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,         -- �����ڵ�
	deptCode	        VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,       -- �μ��ڵ�
	kindHoliday	        NUMBER,         -- �޹� ����
	startHoliday	    TIMESTAMP       DEFAULT sysdate,      -- �޹� ���� ��
	endHoliday	        TIMESTAMP       DEFAULT sysdate,      -- �޹� ���� ��    
	reasonHoliday	    VARCHAR2(500),  -- �޹� ����
	state	            CHAR(1)         DEFAULT '0',    -- �޹� ����
	availableHoliday	NUMBER          DEFAULT 15,     -- �߻��� ��
	remainHoliday	    NUMBER          DEFAULT 15,     -- �ܿ��� ��    
	usedHoliday	        NUMBER          DEFAULT 0       -- ����� ��
);

---------------------------------------------------------------------------------------------------------------------------------------------------------
---���� ���̺�--------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE worktime_tbl (
	worktimeCode	VARCHAR2(20)	PRIMARY KEY,    -- �ٹ��ð� �ڵ�
    empCode	        VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- �����ڵ�
	deptCode	    VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,    -- �μ��ڵ�  
	startWork	    TIMESTAMP       DEFAULT sysdate,  -- �ٹ����� �ð�
	endWork	        TIMESTAMP       DEFAULT sysdate   -- �ٹ����� �ð�		    
);


---------------------------------------------------------------------------------------------------------------------------------------------------------
------- �ٹ� ���� ��û ���̺� ����(2021.04.01) --------------------------------------------------------------------------------------------------------------- 
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE modifyScd_tbl (
	modfiyWorkCode	   NUMBER PRIMARY KEY,                                             -- �ٹ� ����
    scdCode	           NUMBER REFERENCES work_tbl(scdCode) ON DELETE CASCADE,          -- ������ �ڵ�                                          
	empCode	           VARCHAR2(20)	REFERENCES emp_tbl(empCode) ON DELETE CASCADE,     -- �����ȣ
	deptCode	       VARCHAR2(20)	REFERENCES dept_tbl(deptCode) ON DELETE CASCADE,   -- �μ��ڵ�
	modifyDate	       TIMESTAMP default sysdate,  -- ���� ��    
	state	           CHAR(1)	default 0,         -- �������� �ڵ�
	remark	           VARCHAR2(500) default '',   -- ���
	modifyType	       CHAR(1)	default 0,         -- ���� �ٹ� Ÿ�� 
    reqModifyDate	   TIMESTAMP default sysdate   -- �ٹ� ���� ��û ��
);






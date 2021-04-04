import React, { Component } from "react";
import { CardActionArea, CardActions, CardContent, Button, Typography }from '@material-ui/core';
import {Input} from '@material-ui/core';
import "../css/PModal.css";
import axios from 'axios';

/*========== kakaoPay ==========*/
function onClickPayment(cardData,sabun) {
    const userCode = 'imp86058212'; // 가맹점 코드
    
    /* 1. 가맹점 식별하기 */
    const { IMP } = window;
    IMP.init(userCode);
    
    /* 2. 결제 데이터 정의하기 */
    let payData = {
        pg: 'kakaopay',                                 // PG사
        pay_method: 'card',                             // 결제수단
        merchant_uid: `hms_${new Date().getTime()}`,   // 주문번호
        amount: cardData.DCPRICE,                         // 결제금액
        name: cardData.PRODNAME,                           // 주문명(카드제목)
        buyer_name: sabun,                           // 구매자 이름
        buyer_tel: '-',                     // 구매자 전화번호
        buyer_email: '-',               // 구매자 이메일
        buyer_addr: '-',                    // 구매자 주소
        buyer_postcode: cardData.WELFARECODE,          // 구매자 우편번호(쿠폰코드)
    };
    
    /* 4. 결제 창 호출하기 */
        IMP.request_pay(payData, callback);
}

/* 3. 콜백 함수 정의하기 */
function callback(response) {
   
    const {
        success,
        merchant_uid,
        buyer_name,
        buyer_postcode,
        error_msg,
    } = response;

    if (success) {
        alert('결제 성공');
        /*========== 쿠폰에 직원 이름 넣기 ==========*/
        axios({
            method:"POST",
            url: '/api/PCardEmpInsert',
            data:{
                "empCode": buyer_name,
                "welfareCode": buyer_postcode
            }
        }).then((res)=>{
            console.log(res);
        }).catch(error=>{
            console.log(error);
            throw new Error(error);
        });
        
    } else {
    alert(`결제 실패: ${error_msg}`);
    }
}

class PModal extends Component {
    constructor(){
        super();
        this.state = {
            saBun: '사번을 입력하세요',
        };
    }
    
    saBunChange = (e) => {
        this.setState({saBun: e.target.value});
    };

    render() {
        const { open, close, cardIndex, eventList } = this.props;   //아까 버튼에서 props로 가져온것
        const newSaBun = this.state.saBun;
        
        return (
        <>
            {open ? (  

            // 만약 isopen(this.state.isModalOpen)이 true일때 코드를 실행 false면  null
            // <div onClick={close}> 로그인창 말고 회색 바탕을 누를시 모달이 꺼지게 만듬
            ///<span className="close" onClick={close}>&times;</span> x버튼 누를시 꺼짐
            ////<div className="modalContents" onClick={isOpen}> 로그인 화면은 버튼 클릭해서 들어오면
            /// true인 상태로 있어서 화면이 안꺼진다.
        
                <div className="backModal" onClick={close}>
                    <div className="modal">
                        
                        <div className="modalContents">
                            
                                <CardActionArea onClick={open}>
                                
                                <CardContent>
                                    <Typography className="mtitle" style={{fontWeight: 800, color: '#516375'}} gutterBottom variant="h5">
                                        {eventList[cardIndex].PRODNAME}
                                    </Typography>
                                    <Typography variant="body2" color="textSecondary" component="p">
                                        <ul className="descriptions">
                                            <li>{eventList[cardIndex].ROOMKIND}</li>
                                            <li>{eventList[cardIndex].ISBREAKFAST}</li>
                                            <li>{eventList[cardIndex].PRODCONTENTS1}</li>
                                            <li>{eventList[cardIndex].PRODCONTENTS2}</li>
                                            <li>{eventList[cardIndex].PRODCONTENTS3}</li>
                                        </ul>
                                    </Typography>
                                    <div className="pricing">
                                        <Typography variant="h8" style={{textDecoration:'line-through'}}color="textSecondary">
                                            {eventList[cardIndex].REALPRICE.toLocaleString()}
                                        </Typography>
                                        <Typography variant="h5">
                                            {eventList[cardIndex].DCPRICE.toLocaleString()}원
                                        </Typography>
                                    </div>
                                    <div>
                                        <Input type="text" name="empCode" placeholder={newSaBun} onChange={this.saBunChange}/>
                                    </div>
                                </CardContent>
                                    
                                </CardActionArea>

                                <CardActions>
                                    <Button fullWidth variant="contained" style={{backgroundColor:'#ffd517', color: 'black', borderRadius: 0 }}  onClick={() => onClickPayment(eventList[cardIndex],newSaBun)}>
                                        kakaopay 구매
                                    </Button>
                                </CardActions>
                            
                        </div>
                    </div>
                    
                </div>
            ) : null}
        </>
        );
    }
}

export default PModal;
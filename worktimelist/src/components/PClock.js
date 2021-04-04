import React from "react";
import styled from "styled-components";

const Container = styled.div`
  margin-top: 40px;
  font-size: 20px;
`;

const CurTime = styled.div`
  font-weight: 600;
  text-align: center;
`;

class PClock extends React.Component {
    state = {
        date: new Date()
    }
    render() {
        const {date} = this.state;

        return (
        <Container>
            <CurTime>
                {date.getHours() < 10 ? "0" + date.getHours() : date.getHours()}
                &nbsp;:&nbsp;
                {date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()}
                &nbsp;:&nbsp;
                {date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds()}
            </CurTime>
        </Container>
        );
    }
    getDate = () => {
      this.setState({
        date: new Date()
      });
    };
  
    componentDidMount() {
      this.oneSecondCall = setInterval(() => this.getDate(), 1000); // 1초마다 gatDate() 함수 실행
    }
  
    componentWillUnmount() {
      clearInterval(this.oneSecondCall); // setInterval()함수 화면에서 사라지기 직전에 해제
    }
}

export default PClock;

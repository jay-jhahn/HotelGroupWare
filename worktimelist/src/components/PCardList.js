import React, { Component } from "react";
import { Container, Grid } from '@material-ui/core';
import { Card, CardActionArea, CardActions, CardContent, CardMedia, Button, Typography }from '@material-ui/core';
import '../css/PCardList.css';
import PModal from './PModal';

class PCardList extends Component{ 
   
    /*========== 라이프 사이클 ==========*/
    componentDidMount() {
        this.oneSecondCall = setInterval(() => this.getDate(), 1000); // 1초마다 gatDate() 함수 실행
    }
    
    componentWillUnmount() {
        clearInterval(this.oneSecondCall); // setInterval()함수 화면에서 사라지기 직전에 해제
    }

    /*========== 상세내용Modal ==========*/
    constructor(props){
        super(props);
        this.state={
            events: this.props.events,
            cardIndex: null,
            isModalOpen: false,
            date: new Date(),
        };
    }
    
    
    openModal = (id) => {
        this.setState({ cardIndex: id, isModalOpen: true });
        };

    closeModal = () => {
        this.setState({ cardIndex: null, isModalOpen: false });
    };
    
    /*========== 타이머 ==========*/
    getDate = () => {
        this.setState({
          date: new Date()
        });
    };


    /*========== 화면 ==========*/
    render(){
        const {events, date} = this.state;
        let newEvents = null;
        
        if(date.getSeconds() >= 0 && date.getSeconds() < 20){
            newEvents = events.filter(events => events.RNUM %3 === 1);
        } 
        if(date.getSeconds() >= 20 && date.getSeconds() < 40){
            newEvents = events.filter(events => events.RNUM %3 === 2);
        }
        if(date.getSeconds() >= 40 && date.getSeconds() < 60){
            newEvents = events.filter(events => events.RNUM %3 === 0);
        } 
        
        
        const eventItems = newEvents.map((event) => {
            return (
                <Grid item xs={4}>
                    <Card className="root">
                        <CardActionArea>
                        
                        <CardMedia
                            key={event.WELFARECODE}
                            title="Contemplative Reptile"
                        />

                        <CardContent>
                            <Typography className="title" style={{fontWeight: 800}} gutterBottom variant="h5">
                                {event.PRODNAME}
                            </Typography>
                            <Typography variant="body2" color="textSecondary" component="p">
                                <ul className="descriptions">
                                    <li>{event.ROOMKIND}</li>
                                    <li>{event.ISBREAKFAST}</li>
                                    <li>...</li>
                                </ul>
                            </Typography>
                            <div className="pricing">
                                <Typography variant="h8" style={{textDecoration:'line-through'}}color="textSecondary">
                                    {event.REALPRICE.toLocaleString()} 
                                </Typography>
                                <Typography variant="h5">
                                    {event.DCPRICE.toLocaleString()}원
                                </Typography>
                            </div>
                        </CardContent>
                            
                        </CardActionArea>

                        <CardActions>
                            <Button fullWidth variant="contained" style={{backgroundColor:'#55789B', color: 'white', borderRadius: 0 }} onClick={() => this.openModal(event.RNUM -1)}>
                                More Info
                            </Button>
                            
                        </CardActions>
                    </Card>	
                </Grid>
            )
        })

        return(
            <>
            <Container className="root">
                <br>
                </br>
                <Grid container spacing={2}>
                    {eventItems}
                </Grid>
            </Container>
            <PModal open={this.state.isModalOpen} close={this.closeModal} cardIndex={this.state.cardIndex} eventList={this.state.events}/>
            </>
        )
    }
}
export default PCardList;
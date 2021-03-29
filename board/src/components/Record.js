import React, { Component } from 'react';
import { Input , Table, TableBody, TableCell, TableHead, TableRow} from '@material-ui/core';
import '../css/default.css';

class Record extends Component {
    constructor(props){
        super(props)
        this.state = {value : ''}
    }

    render() {
        return(
            <form action='/api/boardInsert' method="POST">      
                <h3 align="center"> 업무일지 </h3>
                <div>
                    <Table>
                        <TableRow>
                            <TableCell value={this.props.description}>{this.props.description}</TableCell>
                        </TableRow>
                            
                     </Table>
                </div>
            </form>
        );
    }
}
export default Record;
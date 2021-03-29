import React, { Component } from 'react';
import { Input , Table, TableBody, TableCell, TableHead, TableRow} from '@material-ui/core';
import '../css/default.css';

class WriteForm extends Component {
    constructor(props){
        super(props)
        this.state = {value : ''}
    }

    render() {
        return(
            <form action='/api/boardInsert' method="POST">      
                <h3 align="center"> 게시글 등록</h3>
                <Table>
                    <TableHead>
                        <TableRow>
                            <TableCell>TITLE</TableCell>
                            <TableCell>CONTENT</TableCell>
                            <TableCell>EMAIL</TableCell>
                            <TableCell></TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        <TableRow>
                            <TableCell>
                                <Input type="next" name="board_title" placeholder="제목을 입력하세요. "/>
                            </TableCell>
                            <TableCell>
                                <Input type="textarea" name="board_content" placeholder="내용을 입력하세요." rows={4} />
                            </TableCell>
                            <TableCell>
                                <Input type="email" name="board_email" placeholder="이메일을 입력하세요."  />
                            </TableCell>
                            <TableCell>
                                <input class ="btn" type="submit" value="글작성" color="primary"  />
                            </TableCell>
                        </TableRow>
                    </TableBody>
                </Table>
            </form>
        );
    }
}
export default WriteForm;
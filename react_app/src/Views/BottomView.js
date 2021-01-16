import React, {useEffect, useState} from "react";
import MessageCard from "../Components/MessageCard";
import StackGrid from "react-stack-grid";
import TextWrapper from "../Components/TextWrapper";
import SizedBox from "../Components/SizedBox";
import DigitRoll from 'digit-roll-react'
import "./BottomView.css";
import { useAsync } from "react-async"

function getDigitCnt(num){
    num = num.toString();
    return num.length;
}


function BottomView() {

    async function getDiaryItems() {
        fetch("http://kkyy3402.iptime.org:21000/rest/getDiaryList?startIdx=0&reqCnt=10")
            .then(res => res.json())
            .then(
                data => {
                    console.log(data)
                    let itemCnt = data["total_count"];
                    setItems(data["data"])
                    //console.log(data["total_count"]);
                },
                error => {

                }
            )
    }

    //const [itemCnt, setItemCnt] = useState(0);
    const [items, setItems] = useState([]);


    const style = {
        paddingLeft: 200,
        paddingRight: 200
    }


    const itemList = [];

    for (let i = 0; i < 200; i++) {
        itemList.push(
            <div>
                <MessageCard/>
            </div>
        )
    }

    //TODO: 무한루프 도는 현상 있음.
    //getDiaryItems();


    return (



        <div style={style}>


            <DigitRoll style={{align:"center"}} num={items.length} length={getDigitCnt(items.length)} divider=""/>

            <TextWrapper contents={"개의 소망이 모여"} size={24} fontWeight={700}/>

            <TextWrapper contents={"애프터 코로나를 기원합니다"} size={24} fontWeight={700}/>

            <SizedBox height={50}/>

            <StackGrid
                columnWidth={400}
            >

                {itemList}

            </StackGrid>
        </div>
    );
}

export default  BottomView;
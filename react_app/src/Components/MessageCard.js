import React from "react";
import LineDivider from "./LineDivider";

function MessageCard(){


    const mainImgFrameStyle = {
        display: "inline"
    }

    //전체 감싸고 있는 뷰 스타일
    const backgroundImgFrameStyle = {
        width : 300,
        height: 400,
        display: "inline-block",
        position: 'relative',
        backgroundImage: 'url("https://github.com/kkyy3402/AFTER_COVID/blob/main/web_app/assets/imgs/card_background1.png?raw=true")',
        bottom:0,
        right:0,
        zIndex : -1000
    }

    //하얀색 박스
    const contentContainerStyle = {
        padding : 16,
        width : 220,
        height : 428,
        backgroundColor : "white",
        display: "inline-block",
        position: 'relative',
        top:30,
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.23,
        shadowRadius: 2.62,

        elevation: 4,
    }

    const uploaderBoxStyle = {
        textAlign : "right",
        fontSize:  16,
        padding: 24,
        height : 60,
        fontFamily: "Nanum Myeongjo"
    }

    const contentBoxStyle = {
        fontSize : 16,
        height : contentContainerStyle.height - uploaderBoxStyle.height,
        fontFamily: "Nanum Myeongjo",
    }

    return (
        <div >

            <div style={backgroundImgFrameStyle}>
                <div style={contentContainerStyle}>
                    <div style={contentBoxStyle}>
                        여기다가 내용을 입력하면 되나요
                    </div>

                    <LineDivider height={1} color={"lightgray"} padding="70"/>

                    <div style={uploaderBoxStyle}>
                        by 어쩌구

                    </div>


                </div>

            </div>

        </div>
    );
}

export default MessageCard;
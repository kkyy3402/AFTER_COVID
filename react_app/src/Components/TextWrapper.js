import React from "react";


function TextWrapper({height, color, size, fontWeight, contents, flex, lineBreak, fontFamily}){

    const style ={
        margin : 16,
        height : height,
        fontWeight : fontWeight,
        color : color,
        fontSize : size,
        flex : flex,
        display : "inline-block",
        fontFamily : fontFamily
    }

    return (
        <div>
            <p style={style}>{contents}</p>
        </div>
    )
}

export default TextWrapper;
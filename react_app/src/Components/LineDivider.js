import React from "react";

function LineDivider({color, height, padding}){

    const style = {

        height:height,
        backgroundColor:color,
        paddingLeft : padding,
        paddingRight : padding
    }

    return (
        <div style={style}>

        </div>
    )
}

export default LineDivider;
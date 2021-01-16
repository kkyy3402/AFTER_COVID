import React from "react";

function SizedBox({width, height}){

    const style={
        marginTop : width,
        height : height
    }

    return (
        <div style={style}>

        </div>
    )
}

export default SizedBox;
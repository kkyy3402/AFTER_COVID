import React from "react";

function ButtonWrapper({text, fontFamily}){

    const style = {
        width: 236,
        height: 57,
        marginTop: 30,
        borderColor: "transparent",
        background: "#000000",
        color: "#ffffff",
        alignItems : "center",
        fontFamily : fontFamily
    }
    return(
        <div>
            <button style={style}>{text}</button>
        </div>
    )
}

export default ButtonWrapper;
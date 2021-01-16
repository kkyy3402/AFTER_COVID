import React from "react";

function InputWrapper({placeholder, padding, fontSize, fontFamily}){

    const style = {
        marginTop : 10,
        width : 568,
        height : 67,
        paddingLeft : 10,
        borderColor : "#ffffff",
        fontWeight : 700,
        fontsize : fontSize,
        fontFamily : fontFamily,

    }

    return(
        <div>
            <input placeholder={placeholder} style={style}/>
        </div>
    )
}

export default InputWrapper
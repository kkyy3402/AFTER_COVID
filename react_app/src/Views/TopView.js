import React , {useState} from "react";
import TextWrapper from "../Components/TextWrapper";
import InputWrapper from "../Components/InputWrapper";
import SizedBox from "../Components/SizedBox";
import ButtonWrapper from "../Components/ButtonWrapper";
import Image from "../Components/ImageWrapper";
import Modal from 'react-modal';

function TopView() {

    //const [str, setStr] = useState("Hi");
    const [modalVisible, setModalVisible] = useState(false)

    const openModal = () => {
        setModalVisible(true)
    }
    const closeModal = () => {
        setModalVisible(false)
    }

    return (
        <div className="mainTopView">
            <div className="navBar">

                <div className="navBarItem">
                    <TextWrapper contents="BILLI" flex="1" fontWeight="500" color="white" fontFamily="Space Mono"/>
                </div>

                <div className="navBarItem">
                    <TextWrapper contents="After Covid-19" flex="1" fontWeight="700" color="white" fontFamily="Noto Sans KR"/>
                </div>

                <div className="navBarItem"/>

            </div>

            <div className="formContainer">

                <Image padding={5} src={"https://github.com/kkyy3402/AFTER_COVID/blob/main/react_app/src/images/moon.png?raw=true"} width={80} height={80}/>

                <TextWrapper fontWeight={0} contents="코로나가 끝나면 나는" color="white" size={42} fontFamily="Nanum Myeongjo"/>

                <InputWrapper fontSize={28} placeholder="하고 싶은 일을 적어주세요" fontFamily="Nanum Myeongjo"/>
                <SizedBox height={10}/>
                <InputWrapper placeholder="이름을 입력해d주세요." fontFamily="Nanum Myeongjo" fontSize={30}/>

                <ButtonWrapper text="소원빌기" fontFamily="Nanum Myeongjo" onClick={
                    () => {
                        openModal()
                    }
                }/>



                {

                }



            </div>

        </div>
    );
}

export default TopView;

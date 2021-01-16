import './App.css';
import './style.css';
import {Container} from "@material-ui/core";

function App() {
    return (
        <div className="App">

            <div
                className="mainTopView"
            >
                <div
                    className="navBar"
                >

                    <div
                        className="navBarItem"
                    >BILLI</div>

                    <div
                        className="navBarItem"
                    >After COVID-19</div>

                    <div
                        className="navBarItem"
                    >
                    </div>


                </div>

                <div className="formContainer">

                    <div className="moonImg"></div>

                    <h3>코로나가 끝나면 나는 당장</h3>
                    <input className="textInputForm" placeholder="하고 싶은 일을 적어주세요."/>

                    <br/>

                    <input className="textInputForm" placeholder="이름을 입력해주세요."/>

                    <br/>

                    <button className="submitBtn">
                        소원빌기
                    </button>



                </div>

            </div>

        </div>
    );
}

export default App;

/*นำเข้า react เเสดงหน้าจอบนเว็บpage */
//เนื่องจากเว็บAPI การประกาศเรียกใช้ path url ค่อนข้างยากเเละหาจุดเชื่อมได้ยาก จึงเเยกออกมาเป็นหลายช่องให้ serach หา ได้
//function ที่ใช้งาน Serach 
import {Link} from "react-router-dom";
//นำเข้า react hooksสามารถใช้งาน useModal หรือการ popup page ขึ้นมา
import { useModal } from "react-hooks-use-modal";
/*นำเข้า react hooksสามารถใช้งาน state และเรียกใช้ features ต่างๆ ของ 
React ได้ โดยที่ไม่ต้องเขียนแบบ class component*/
//import React, {useReducer, useEffect, useState  } from "react";
import React, { useEffect, useState } from "react";
//นำเข้า css
import "./App.css";

/*     --------------------

       Function สำหรับ movie

      ---------------------       */
//เว็บใช้ดึง Api https://www.themoviedb.org/      
const MOVIE_API_URL =
  "https://api.themoviedb.org/3/search/movie?api_key=078c6d39cd90a6ba2fe67e36eb1a1a6c&query=Forrest";

const Movie = ({ movie }) => {
  //นำเข้า modal เพื่อเเสดงหน้า popup
  const [Modal, open, close] = useModal("root", {
    preventScroll: true,
    closeOnOverlayClick: false,
  });

  //ใช้ if เพื่อกำหนดให้ เเสดงออกเเต่ผลลัพธ์ที่มีรูปภาพ
  if (movie.backdrop_path !== null && movie.overview !== "") {
    return (
      <div className="movie">
         {/*ค้นหา ภาพเเสดงรายละเอียดภาพของหนัง เเละ ชื่อหนัง */}
        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        ></link>
        <h2>{movie.original_title}</h2>
        <div>
          <img
          class="full"
            alt={`The movie titled: ${movie.original_title}`}
            src={"https://image.tmdb.org/t/p/original/" + movie.backdrop_path}
          />
        </div>
        <p>({movie.release_date})</p>
        <div>
          <button onClick={open}><h4><i class="fa fa-info-circle" ></i>  OPEN DETAILS</h4></button>
           {/*เนื่อหาขึ้นมาเป็น POPUP ดึงข้อมูลของ detailed */}
          <Modal>
            <div class="block">
              <h1>Title : {movie.original_title}</h1>
              <img
                class="left"
                alt={`The movie titled: ${movie.original_title}`}
                src={
                  "https://image.tmdb.org/t/p/original/" + movie.backdrop_path
                }
              />
              <div class="right">
                <table>
                  <tr>
                    <th><h2>ข้อมูล</h2></th>
                    <th><h2>รายละเอียด</h2></th>
                  </tr>
                  <tr>
                    <td>
                      <h3>DETAIL :</h3>
                    </td>
                    <td>{movie.overview}</td>
                  </tr>
                  <tr>
                    <td>
                      <h3>Year :</h3>
                    </td>
                    <td>{movie.release_date}</td>
                  </tr>
                  <tr>
                    <td>
                      <h3>Language :</h3>
                    </td>
                    <td>{movie.original_language}</td>
                  </tr>
                  <tr>
                    <td>
                      <h3>Popularity :</h3>
                    </td>
                    <td>{movie.popularity}</td>
                  </tr>
                  <tr>
                    <td>
                      <h3>Vote_AVG :</h3>
                    </td>
                    <td>{movie.vote_average}/10</td>
                  </tr>
                  <tr>
                    <td>
                      <h3>ID :</h3>
                    </td>
                    <td>{movie.id}</td>
                  </tr>
                </table>
              </div>
              <button onClick={close}>CLOSE</button>
            </div>
          </Modal>
        </div>
      </div>
    );
  }
};
/*     --------------------
    
       Function สำหรับ Search

      ---------------------       */
//ที่เป็น React.Component เพื่อให้this.state สามารถประกาศใช้งานได้เนื่องจากไม่ใช่ส่วนของ hook
  class Search extends React.Component
{
  //สามารถใส่ข้อมูลเข้ามาได้
  constructor(props) {
    super(props);
  this.state = {
    title: "",
  };
  this.handleChange = this.handleChange.bind(this);
  this.handleSubmit = this.handleSubmit.bind(this);
  }
  //เปลี่ยน value ใน name 
    handleChange(e) {
      const target = e.target;
      const value = target.value;
      const elementname = target.name;
      this.setState({
      [elementname]: value,
      });
    }
    handleSubmit(e) {
      e.preventDefault();
      //เพื่อเชื่อม state ที่สามารถนำค่าเข้า fetch รับค่าที่ส่วนนี้ ที่ไม่สามารถกำหนดให้ run ใน value เดียวกันได้เนี่องจากเว็บต้นทาง ให้ path การเข้าถึงที่ค่อนข้างจำกัด จึงต้องมีค่ามารับหลายค่า
  this.props.search(this.state.title);
   };
  render() {
  /* type ที่กำหนดให้เป็น การserchธรรมดา */
    return (
      <form className="search">
        <label><h4><i class="fa fa-video-camera" aria-hidden="true"></i>  Title:</h4></label>
        <input
        name="title"
          class="title"
          placeholder="ex: Iron Man , zombie , king man , Uncharted , ร่างทรง , joker"
          value={this.state.title}
          onChange={this.handleChange}
          type="text"
        />
        <button class="searchs" onClick={this.handleSubmit} type="submit">SEARCH  <i class="fa fa-search-plus" aria-hidden="true"></i>
</button>
      </form>
    );
};
}
//function สำหรับ Output
const Normalsearch = () => {
  const [loading, setLoading] = useState(true); //ใช้ในการ loading เมื่อยังไม่ได้ข้อมูลจะเป็น state ของการนำเข้าข้อมูล เเละเมื่อได้ข้อมูลจะเปลี่ยนเงื่อนไข
  const [movies, setMovies] = useState([]); //ใช้ในการเก็บข้อมูลของmovie
  const [errorMessage, setErrorMessage] = useState(null); //ใช้เพื่อหาว่ามี errorมั้ย set เป็น nullก่อน

  useEffect(() => {
    fetch(MOVIE_API_URL)
      .then((response) => response.json())
      .then((jsonResponse) => {
        setMovies(jsonResponse.results);
        setLoading(false);
      });
  }, []);

   //1. function สำหรับเงื่อนไข search หา ชื่อเรื่องภาพยนต์
   const search = (searchValue) => {
    setLoading(true);
    setErrorMessage(null);
    fetch(
      `https://api.themoviedb.org/3/search/movie?&query=${searchValue}&api_key=078c6d39cd90a6ba2fe67e36eb1a1a6c`
    )
      .then((response) => response.json())
      .then((jsonResponse) => {
        console.log(jsonResponse);
        if (jsonResponse.total_results > 0) {
          setMovies(jsonResponse.results);
          setLoading(false);
        }
        else{
             alert("Please enter movie information")
        }

      });
  };
   //นำเข้าค่า search ผ่าน function เเละ component serch
  //นำเข้า style ภายนอก https://cdnjs.cloudflare.com
  return (
    <div >
      <div class="container">
        <h1 class="movieserach"><i class="fa fa-ticket"></i> Movie Search </h1>
      </div>
      <p>
      <h2><i class="fa fa-file-image-o" aria-hidden="true"></i> Normal Search <i class="fa fa-search"></i></h2>
      <button class="link" ><Link to="/advance"><i class="fa fa-puzzle-piece" aria-hidden="true"></i>  Advance search</Link></button>
      </p>
      <Search search={search} />
      <center>
        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        ></link>
      
      </center>
      <div className="movies">
        {/*____ ? ___(true) : ___(flase) */}
        {loading && !errorMessage ? (
          <div class="errorMessage">{errorMessage}</div>
        ) : (
          movies.map((movie, element) => <Movie key={`${element}`} movie={movie} />)
        )}
      </div>
    </div>
  );
};
export default Normalsearch;
/*เเหล่งที่มา
[ใช้สำหรับการใช้hook]
--https://reactjs.org/docs/hooks-intro.html
[Operation ?-->____ ? ___(true) : ___(flase) ]
--https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_Operator
[ Map ค่าใน Array แต่ละตัวจะทำการนำไปผ่าน Function ที่เรากำหนดไว้ แต่ Map นั้น 
สามารถ return ค่าออกมาได้โดยค่าที่ return ออกมาจะเป็น Array]
--https://medium.com/@camp191/javascript-
[เว็บเอาApi]
--https://www.themoviedb.org/
[เว็บหาpopup page]
--https://reactjsexample.com/tag/popup/
[css จากภายนอก นำiconเข้ามา]
--https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css
*/

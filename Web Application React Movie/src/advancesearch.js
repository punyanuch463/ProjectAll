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
          {/*ฝั่งข้อมูลใน POPUP จัดทำเป็นตารางโขว์ข้อมูล  */}
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
  //สามารถใส่ข้อมูลที่รับเข้ามาจากinputได้
  constructor(props) {
    super(props);
  this.state = {
    tp:"",
    year: "",
    title2: "",
    Bestyear: "",
    year1: "",
    year2 : ""
  };
  this.handleChange = this.handleChange.bind(this);
  this.handleSubmit = this.handleSubmit.bind(this);
  }
  //สามารถรับค่าvalue มาได้จาก input namevtwi 
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
  this.props.search(this.state.tp);
  this.props.search(this.state.Bestyear);
  this.props.search(this.state.title2,this.state.year,);
  this.props.search(this.state.year1,this.state.year2,);
  };
  render() {

 /* type ที่กำหนดให้เป็น การserch type */
if (this.props.type === "advance") {
    return (
      <form className="search">
        <label><h4><i class="fa fa-clone" aria-hidden="true"></i>  Type :</h4></label>
        <input
        name="tp"
        class="title"
        placeholder="ex: western , scifi , mystery ,romance ,horror ,action ,comedy "
          value={this.state.tp}
          onChange={this.handleChange}
          type="text"
        />
         <button class="searchs" onClick={this.handleSubmit} type="submit">SEARCH  <i class="fa fa-search-plus" aria-hidden="true"></i>
</button> </form>
    );


    /* type ที่กำหนดให้เป็น การserch Best rated movie of the year */
  } else if (this.props.type === "advance2") {
    return (
      <form className="search">
        <br></br>
        <label><h4> <i class="fa fa-calendar" aria-hidden="true"></i>  Year :</h4></label>
        <input
        name="Bestyear"
          class="year"
          placeholder="ex: 2011 , 2022"
          value={this.state.Bestyear}
          onChange={this.handleChange}
          type="text"
        />
        <button class="searchs" onClick={this.handleSubmit} type="submit">SEARCH  <i class="fa fa-search-plus" aria-hidden="true"></i>
</button> 
</form>
    );

    // search title + year
  } else if (this.props.type === "sumvalue") {
    return (
      <form className="search">
        <label><h4><i class="fa fa-video-camera" aria-hidden="true"></i> Title:</h4></label>
        <input
         name="title2"
          class="title"
          placeholder="ex: Iron Man , zombie , king man , Uncharted , ร่างทรง , joker "
          value={this.state.title2}
          onChange={this.handleChange}
          type="text"
        />
        <br></br>
        <label><h4><i class="fa fa-calendar" aria-hidden="true"></i>  Year: </h4></label>
        <input
         name="year"
         placeholder="ex: 2011 , 2022"
         value={this.state.year}
         onChange={this.handleChange}
          type="text"
        />
        <button class="searchs" onClick={this.handleSubmit} type="submit">SEARCH  <i class="fa fa-search-plus" aria-hidden="true"></i></button>  
 </form>
    );
  }

   // search year1 + year2
  else if (this.props.type === "sumvalue2") {
    return (
      <form className="search">
        <h4><i class="fa fa-hand-o-right" aria-hidden="true"></i>  Best rated movie of the year to year : </h4>
        <input
         name="year1"
          class="year"
          placeholder="ex: 2011 , 2022"
          value={this.state.year1}
          onChange={this.handleChange}
          type="text"
        />
        <br></br>
        <h4> <i class="fa fa-calendar" aria-hidden="true"></i>  Year :</h4>
        <input
         name="year2"
         class="year"
         placeholder="ex: 2011 , 2022"
         value={this.state.year2}
         onChange={this.handleChange}
          type="text"
        />
        <button class="searchs" onClick={this.handleSubmit} type="submit">SEARCH  <i class="fa fa-search-plus" aria-hidden="true"></i>
</button> 
  </form>
    );
  }
};
}
//function สำหรับ Output
const Advancesearch = () => {
  const [loading, setLoading] = useState(true); //ใช้ในการ loading เมื่อยังไม่ได้ข้อมูลจะเป็น state ของการนำเข้าข้อมูล เเละเมื่อได้ข้อมูลจะเปลี่ยนเงื่อนไข
  const [movies, setMovies] = useState([]); //ใช้ในการเก็บข้อมูลของmovie
  const [errorMessage, setErrorMessage] = useState(null); //ใช้เพื่อหาว่ามี errorมั้ย set เป็น nullก่อน
//เป็นการเซ็ทค่าเริ่มต้นก่อนที่จะ ลงเงื่อนไขต่างๆที่ใช้ในการค้นหา ผ่าน fetch API 
  useEffect(() => {
    fetch(MOVIE_API_URL)
      .then((response) => response.json())
      .then((jsonResponse) => {
        setMovies(jsonResponse.results);
        setLoading(false);
      });
  }, []);

  //1. function สำหรับเงื่อนไข search หา ประเภทของหนัง
  const searchadvance = (searchValueadvance) => {
    setLoading(true);
    setErrorMessage(null);
    //พิจารณา ค่า value หากเป็นภาษาให้เเปลงเป็นตัวเลขเพื่อใช้ได้กับเว็บไซค์
    let condition = searchValueadvance
    if (condition === "action"|| condition === "Action") {
      condition = "28";
    } else if (condition === "comedy" || condition === "Comedy" ) {
      condition = "35";
    } else if (condition === "horror" || condition ===  "Horror" ) {
      condition = "27";
    } else if (condition === "romance"   || condition === "Romance" ) {
      condition = "10749";
    } else if (condition === "animation" || condition === "Animation" ) {
      condition = "16";
    } else if (condition === "mystery" || condition === "Mystery" ) {
      condition = "9648";
    } else if (condition === "scifi" || condition === "Scifi") {
      condition = "878";
    } else if (condition === "western" || condition === "Western") {
      condition = "37";
    }
    console.log(condition)
    fetch(
      `https://api.themoviedb.org/3/discover/movie?&language=en-US&page=1&with_genres=${condition}&sort_by=popularity.desc&api_key=078c6d39cd90a6ba2fe67e36eb1a1a6c`
    )
      .then((response) => response.json())
      .then((jsonResponse) => {
        console.log()
        console.log(jsonResponse)
        if (jsonResponse.total_results > 0) {
          setMovies(jsonResponse.results);
          setLoading(false);
        }
      });
  };
 //2. function สำหรับเงื่อนไข search หา bestyear นะปีนั้นๆที่คนเปิดเข้าดูบ่อย
 const searchvaluebestyear = (searchvaluebestyear) => {
  setLoading(true);
  setErrorMessage(null);
  fetch(
    `https://api.themoviedb.org/3/discover/movie/?certification_country=US&certification=R&sort_by=vote_average.desc&page=1&primary_release_year=${searchvaluebestyear}&api_key=078c6d39cd90a6ba2fe67e36eb1a1a6c`
  )
    .then((response) => response.json())
    .then((jsonResponse) => {
      if (jsonResponse.total_results > 0) {
        setMovies(jsonResponse.results);
        setLoading(false); 
      }
    });
};
  //3. เงื่อนไขหา 2 อย่างพร้อมกัน
 
  const searchsum = (searchtitle, searchyear) => {
    setLoading(true);
    setErrorMessage(null);
    fetch(
      `https://api.themoviedb.org/3/search/movie?&query=${searchtitle}&primary_release_year=${searchyear}&api_key=078c6d39cd90a6ba2fe67e36eb1a1a6c`
    )
      .then((response) => response.json())
      .then((jsonResponse) => {
        console.log(jsonResponse);
        if (jsonResponse.total_results > 0) {
          setMovies(jsonResponse.results);
          setLoading(false);
        }
      });
    }
    const searchyeartoyear = (searchyear1, searchyear2) => {
      setLoading(true);
      setErrorMessage(null);
      fetch(
        `https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=${searchyear1}&primary_release_date.lte=${searchyear2}&api_key=078c6d39cd90a6ba2fe67e36eb1a1a6c`
      )
        .then((response) => response.json())
        .then((jsonResponse) => {
          console.log(jsonResponse);
          if (jsonResponse.total_results > 0) {
            setMovies(jsonResponse.results);
            setLoading(false);
          }
        });
    };
  ;
  //นำเข้าค่า search ผ่าน function เเละ component serch
  //นำเข้า style ภายนอก https://cdnjs.cloudflare.com
  return (
    <div >
        
      <div class="container">
        <h1 class="movieserach"><i class="fa fa-ticket"></i> Movie Search </h1>
      </div>
      <center>
        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        ></link>
    
        <h2><i class="fa fa-puzzle-piece" aria-hidden="true"></i> Advance Search <i class="fa fa-search"></i></h2>
        <button class="link" ><Link class="text"to="/"><i class="fa fa-file-image-o" aria-hidden="true"></i>  Normal search</Link></button>
        <div>
          <Search search={searchadvance} type="advance" />
          <Search search={searchvaluebestyear} type="advance2" />
        </div>
        <p>
        <h2> Mutiple Search <i class="fa fa-search"></i>  </h2>
        </p>
        <div>
          <Search search={searchsum} type="sumvalue" />
        </div>
        <p>
        <h2> Search movies during the year  <i class="fa fa-search"></i> </h2>
        </p>
        <div>
        <Search search={searchyeartoyear} type="sumvalue2" />
        </div>
       </center>
      <div className="movies">
        {/*____ ? ___(true) : ___(flase) ขั้นตอนนี้เเสดงถึงว่าหาก error == true ให้ส่ง errorออกไป หาก ไม่ให้ส่งเซ็ทหนัง ที่ประกาศเป็น key value ในการรับเข้ามา*/}
        {loading && !errorMessage ? (
          <div className="errorMessage">{errorMessage}</div>
        ) : (
          movies.map((movie, element) => <Movie key={`${element}`} movie={movie} />)
        )}
      </div>
    </div>
  );
};
//export default เพื่อนำพา funtion ตัวนี้ไปยัง index.js
export default Advancesearch;

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

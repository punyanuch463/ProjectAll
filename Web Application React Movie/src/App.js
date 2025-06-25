
import {BrowserRouter, Routes, Route} from "react-router-dom";
import Normal from "./normalsearch";
import Advance from "./advancesearch";
function App() {
return (
//นำเข้า router เพื่อใช้ในการ path ไปยังเส้นทางที่เราสร้าง companent
<BrowserRouter>
<Routes>
<Route path="" element={<Normal />} />
<Route path="/advance" element={<Advance />} />
</Routes> 
</BrowserRouter>
)
};
//export default เพื่อนำพา funtion ตัวนี้ไปยัง index.js
export default App;
//เชื่อม port 3002
const express = require("express");
const path = require("path");
const port = 3002;
const app = express();
const router = express.Router();
app.use(router);
const dotenv = require("dotenv");
dotenv.config();
router.use(express.json());
router.use(express.urlencoded({ extended: true }));

/*กำหนดpath ที่จะเข้าถึงในlocal path*/
app.use("/", express.static(path.join(__dirname, "css")));
app.use("/", express.static(path.join(__dirname, "Images")));
app.use("/", express.static(path.join(__dirname, "pdf")));
app.use("/", express.static(path.join(__dirname, "product")));
app.use("/", express.static(path.join(__dirname, "js")));
app.use("/", express.static(path.join(__dirname, "pageApproveTable")));
app.use("/", express.static(path.join(__dirname, "pageDownload")));
app.use("/", express.static(path.join(__dirname, "pagePreview")));
app.use("/", express.static(path.join(__dirname, "pageHeadPreview")));
app.use("/", express.static(path.join(__dirname, "pageChange")));
/*กำหนดส่วน get */
router.get("/", (req, res) => {
  res.send("WELCOME CUSTOMER");
});
router.get("/email", (req, res) => {
  res.sendFile(path.join(`${__dirname}/email.html`));
});
router.get("/noti", (req, res) => {
  res.sendFile(path.join(`${__dirname}/notification.html`));
});
router.get("/nav", (req, res) => {
  console.log("test...");
  res.sendFile(path.join(`${__dirname}/nav.html`));
});
router.get("/login", (req, res) => {
  res.sendFile(path.join(`${__dirname}/login.html`));
});
router.get("/pdpa", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pdpa.html`));
});
router.get("/homepage", (req, res) => {
  console.log("homepage...");
  res.sendFile(path.join(`${__dirname}/homepage.html`));
});

router.get("/Payment", (req, res) => {
  console.log("Payment...");
  res.sendFile(path.join(`${__dirname}/Payment_Signature.html`));
});
router.get("/Signature", (req, res) => {
  console.log("Signature...");
  res.sendFile(path.join(`${__dirname}/test.html`));
});
router.get("/AttachAddress", (req, res) => {
  console.log("Attach Address...");
  res.sendFile(path.join(`${__dirname}/Attach_document_Address.html`));
});
router.get("/AttachName", (req, res) => {
  console.log("Attach Name...");
  res.sendFile(path.join(`${__dirname}/Attach_document_Name.html`));
});
router.get("/ChangeNewName", (req, res) => {
  console.log("Attach Name...");
  res.sendFile(path.join(`${__dirname}/pageChange/ChangeNewName.html`));
});
router.get("/ChangeOldName", (req, res) => {
  console.log("Attach Name...");
  res.sendFile(path.join(`${__dirname}/pageChange/ChangeOldName.html`));
});
router.get("/ChangeMBPhone", (req, res) => {
  // console.log("Attach Name...");
  res.sendFile(path.join(`${__dirname}/pageChange/ChangeMBPhone.html`));
});
router.get("/ChangeAddress", (req, res) => {
  // console.log("Attach Name...");
  res.sendFile(path.join(`${__dirname}/pageChange/ChangeAddress.html`));
});
router.get("/Approve", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageApproveTable/ApproveTable.html`));
});
router.get("/ApproveName", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageApproveTable/ApproveTableName.html`));
});
router.get("/ApproveAddr", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageApproveTable/ApproveTableAddr.html`));
});
router.get("/ApproveMob", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageApproveTable/ApproveTableMob.html`));
});
router.get("/Downloadspell", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageDownload/Downloadspell.html`));
});
router.get("/Downloadaddrper", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageDownload/Downloadaddrper.html`));
});
router.get("/Downloadaddrcur", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageDownload/Downloadaddrcur.html`));
});
router.get("/Downloadaddrcon", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageDownload/Downloadaddrcon.html`));
});
router.get("/Downloadname", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageDownload/Downloadname.html`));
});
router.get("/HeadPreviewMobile", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageHeadPreview/HeadPreview_ChangeMobilephone.html`));
});
router.get("/HeadPreviewAddrPer", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageHeadPreview/HeadPreview_ChangeAddrPermenent.html`));
});
router.get("/HeadPreviewAddrCur", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageHeadPreview/HeadPreview_ChangeAddrCurrent.html`));
});
router.get("/HeadPreviewAddrCon", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageHeadPreview/HeadPreview_ChangeAddrContact.html`));
});
router.get("/HeadPreviewName", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageHeadPreview/HeadPreview_ChangeName-Surname.html`));
});
router.get("/HeadPreviewedit", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pageHeadPreview/HeadPreview_EditingSpelling.html`));
});

router.get("/PreviewAddrCon", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pagePreview/Preview_ChangeAddrContact.html`));
});
router.get("/PreviewAddrCur", (req, res) => {
  res.sendFile(path.join(`${__dirname}/pagePreview/Preview_ChangeAddrCurrent.html`));
});
router.get("/PreviewAddrPer", (req, res) => {

  res.sendFile(path.join(`${__dirname}/pagePreview/Preview_ChangeAddrPermenent.html`));
});
router.get("/PreviewMobile", (req, res) => {
 
  res.sendFile(path.join(`${__dirname}/pagePreview/Preview_ChangeMobilephone.html`));
});
router.get("/PreviewName", (req, res) => {

  res.sendFile(path.join(`${__dirname}/pagePreview/Preview_ChangeName-Surname.html`));
});
router.get("/PreviewSpell", (req, res) => {

  res.sendFile(path.join(`${__dirname}/pagePreview/Preview_EditingSpelling.html`));
});
// router.post("/addadmin", function (req, res) {
//   console.log(req.method);
//   console.log(`Form submitted by ${req.body.fname}`);
//   res.redirect(`/addadmin`);
// });

/* กำหนดเมื่อเข้าถึง port เเล้ว*/

app.listen(process.env.PORT, function () {
  console.log("Server listening at Port " + process.env.PORT);
});
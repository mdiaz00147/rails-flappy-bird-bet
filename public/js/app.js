(window.onload = function() {
  // Initialize Firebase
var config = {
  apiKey: "AIzaSyDXRk0FMI4mpvhhUNgS6e0eHDgRUrOdMZE",
  authDomain: "ace-off.firebaseapp.com",
  databaseURL: "https://ace-off.firebaseio.com",
  projectId: "ace-off",
  storageBucket: "ace-off.appspot.com",
  messagingSenderId: "984067976868"
};
firebase.initializeApp(config);

//Get Elements
const txtFirst = document.getElementById('Fname');
const txtLast = document.getElementById('Lname');
const txtEmail = document.getElementById('userEmail');
const txtPass = document.getElementById('userPassword');
const btnSignUp = document.getElementById('userSignUp');
const btnLogin = document.getElementById('userSignIn');
const btnLogOut = document.getElementById('userLogOut');

var user = firebase.auth().currentUser;
const databaseRef = firebase.database().ref().child('Users');
//Add login event
btnLogin.addEventListener('click', e => {

//Get email and Password

const email = txtEmail.value;
const pass = txtPass.value;
const auth = firebase.auth();

//Sign in
const promise = auth.signInWithEmailAndPassword(email, pass);

promise.catch(e => console.log(e.message));
firebase.auth().onAuthStateChanged(function(user) {
  if (user) {
    handler.open({
      name: 'Ace Off Contests',
      description: '2012 Chevy Camaro Contests',
      zipCode: true,
      amount: 3000
    });
  } else {
  $('#myModal').modal('hide')
  }
});
});

function writeUserData(first, last) {
  var user = firebase.auth().currentUser;
  var uid = user.uid;
  var first = txtFirst.value;
  var last = txtLast.value;
  var user = firebase.auth().currentUser;
  databaseRef.child(uid).set({
    first_name: first,
    last_name: last
  });
}

function writeHighScore(highScore) {

}

//Sign Up Event
btnSignUp.addEventListener('click', e => {
// TODO: Check for real emails
  const email = txtEmail.value;
  const pass = txtPass.value;
  const auth = firebase.auth();

const promise = auth.createUserWithEmailAndPassword(email, pass);
promise.catch(e => console.log(e.message));
writeUserData();
firebase.auth().onAuthStateChanged(function(user) {
  if (user) {
    document.getElementById('bodycon').innerHTML = "You've Successfully Signed Up, Close to start playing!";
  } else {
    // No user is signed in.
  }
});
});


//Logout Users
btnLogOut.addEventListener('click', e => {
  firebase.auth().signOut();
});

//Adding realtime listener
firebase.auth().onAuthStateChanged(firebaseUser => {
  if(firebaseUser) {
    console.log(firebaseUser);
  } else {
    console.log('not logged in');
  }
});






}());

import express from 'express'

import { getUser, getUsers, getUsersViaUsername, createUser, getWorkouts, getRecipes, createWorkout, createExercise, createRecipe, addFollowing, getFollowing, deleteFollowing, saveUserImage } from './database.js'

const app = express() // Using express 5 beta for asynchronous error handling,
                      // which deals with errors in a single place and makes things more readible.

app.use(express.json({limit: '50mb'})) // So that any JSON body will be accepted and used in the req.body object.

app.get('/', async (req, res) => {
    res.send("Home Page!")
})


// USER RELATED QUERIES (endpoints in swiftui) -----------------------------------------------------------------

// Get a user
app.get("/login/:username/:password", async (req, res) => {
    const username = req.params.username
    const password = req.params.password
    console.log("Getting User...")
    const user = await getUser(username, password)
    console.log("Get user worked!")
    user.following = []
    const followingResponse = await getFollowing(user.username)

    // Gets rid of column name for each response ( turns { followee_username: value } into [value] )
    for (let x in followingResponse) {
        user.following.push(followingResponse[x].followee_username)
    }

    res.send(user)
})

// Create a user
app.post("/create-user", async (req, res) => {
    const { username, password, biography } = req.body
    const user = await createUser(username, password, biography)
    res.status(201).send(user)
})

// Get users with certain chracters
app.get('/users/:username', async (req, res) => {
    console.log("Getting Users...")
    const username = req.params.username
    const users = await getUsersViaUsername(username)
    for (let x in users) {
        users[x].following = []
    }
    res.send(users)
})

// Add a following
app.post("/add-following", async (req, res) => {
    const username = req.body[0]
    const following_username = req.body[1]
    console.log(req.body)
    user = await addFollowing (username, following_username)
})

// Delete a following
app.delete("/delete-following", async (req, res) => {
    const username = req.body[0]
    const following_username = req.body[1]
    console.log(req.body)
    await deleteFollowing (username, following_username)
})

// Get following using username
app.get('/get-following/:username', async (req, res) => {
    console.log("Getting Following...")
    const username = req.params.username
    const following = await getFollowing(username)
    res.send(following)
})

app.patch('/save-user-image/:id', async (req, res) => {
    const user_id = req.params.id
    console.log(user_id)
    const { data } = req.body
    const user = await saveUserImage(user_id, data)
    res.status(201)
})


// POST RELATED QUERIES -----------------------------------------------------------------

// Get workouts with associated username
app.get('/workouts/:username', async (req, res) => {
    const username = req.params.username
    console.log("Getting Workouts...")
    const workouts = await getWorkouts(username)
    res.send(workouts)
})

// Get recipes with associated username
app.get('/recipes/:username', async (req, res) => {
    const username = req.params.username
    console.log("Getting Recipes...")
    const recipes = await getRecipes(username)
    res.send(recipes)
})

// Create a workout
app.post("/create-workout", async (req, res) => {
    console.log("Creating workout...")
    const { title, timeReq, desc, exercises } = req.body
    const workout_id = await createWorkout(title, timeReq, desc, "CarlLund")

    for (let x in exercises) {
        await createExercise(exercises[x], workout_id)
    }

    res.status(201)
})

// Create a recipe
app.post("/create-recipe", async (req, res) => {
    console.log("Creating recipe...")
    const { title, timeReq, description, username, ingredients, directions } = req.body
    await createRecipe(title, timeReq, description, username , ingredients, directions)
    res.status(201)
})


// MISC QUERIES (endpoints not in swiftui) -----------------------------------------------------------------

// Get all of the users
app.get('/users', async (req, res) => {
    console.log("Getting Users...")
    const users = await getUsers()
    console.log("Get users worked!")
    res.send(users)
})

// Single middleware function for error handling. I can log the error on the server
// and as the developer go to check the logs for any errors. Need to send error message
// back to client.
app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send('Something broke!') // Message being sent to user.
})

app.listen(3000, () => {console.log('Server is running on port 3000')})
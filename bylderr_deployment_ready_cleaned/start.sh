#!/bin/bash

echo "Starting Bylderr Deployment..."

# Load environment variables
export $(grep -v '^#' .env | xargs)

# Start backend
echo "Starting Backend..."
cd backend
npm install
nohup npm start > backend.log 2>&1 &

# Start frontend
echo "Starting Frontend..."
cd ../frontend
npm install
nohup npm run build > frontend.log 2>&1 &
nohup npm run start > frontend.log 2>&1 &

echo "Bylderr is now running!"

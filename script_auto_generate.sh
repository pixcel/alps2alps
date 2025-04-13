# Path to SDK Flutter
FLUTTER_PATH="/Users/eugenekrasnopolskiy/work/flutter/3.29.1/flutter"

# Clean up realm
echo "Clean up data"
("$FLUTTER_PATH/bin/flutter" clean)

# List of directories for which you need to execute commands
DIRECTORIES=("data" "domain")

# Function for executing commands in the directory
ExecuteCommandsInDirectory() {
    local directory="$1"
    echo "Running commands in the directory $directory"
    (cd "$directory" && "$FLUTTER_PATH/bin/dart" pub get && "$FLUTTER_PATH/bin/dart" run build_runner build --delete-conflicting-outputs)
}

# Execute the commands for each directory
for dir in "${DIRECTORIES[@]}"; do
    ExecuteCommandsInDirectory "$dir"
done

# Run the commands for the root directory
echo "Executing commands in the root directory"
("$FLUTTER_PATH/bin/dart" pub get && "$FLUTTER_PATH/bin/dart" run build_runner build --delete-conflicting-outputs)

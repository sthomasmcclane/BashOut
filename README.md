# BashOut: A Simple Writing App

BashOut is a minimalist writing tool designed to help you focus on writing by providing a clean interface and tracking your word count. It comes in two flavors, both designed to work seamlessly across platforms:

1. **Terminal Version** (Original): A lightweight Bash script that runs in any Unix-like terminal (macOS, Linux)
2. **GUI Version**: A cross-platform PyQt5-based desktop application (macOS, Windows, Linux)

## Terminal Version (Original)

The terminal version is a simple Bash script that provides:
- A clean, distraction-free writing interface
- Word count tracking
- Inspirational banners, notes, and style prompts
- Automatic saving of your work

### Installation

1. Fork and clone this repository
2. Make the scripts executable:
```bash
chmod +x bashout.sh styles.sh
```

### Usage

Run the script:
```bash
./bashout.sh
```

For detailed documentation about the terminal version, including banner options, configuration, and customization, see [README.adoc](README.adoc).

## GUI Version

The GUI version provides the same core functionality as the terminal version but with a modern desktop interface that works identically across all major platforms:
- Clean, distraction-free writing environment
- Manuscript management (create, rename, switch between)
- Word count tracking
- Last sentence display
- Light/dark theme support
- Font size adjustment
- Automatic saving

### Requirements

- Python 3.x (available on all major platforms)
- PyQt5 (cross-platform GUI framework)

### Installation

1. Install the required Python package:
```bash
pip install PyQt5
```

2. Run the GUI version:
```bash
python3 bashout_gui.py
```

### Features

- **Manuscript Management**
  - Create new manuscripts (⌘+N on Mac, Ctrl+N on Windows/Linux)
  - Rename manuscripts (⌘+R on Mac, Ctrl+R on Windows/Linux)
  - Click the manuscript name to manage

- **Writing Interface**
  - Large, centered text input
  - Word count display
  - Last sentence preview
  - Automatic saving

- **Customization**
  - Toggle between light and dark themes
  - Adjust font size
  - Choose save location

## License

This project is licensed under the terms of the LICENSE file included in this repository. 
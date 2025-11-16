#!/usr/bin/env python3
import json
import re
from pathlib import Path

# Model ID mappings
MODEL_MAPPINGS = {
    # Old Haiku models -> new Haiku 4.5
    "claude-3-haiku-20240307": "claude-haiku-4-5-20251001",
    "claude-3-5-haiku-20241022": "claude-haiku-4-5-20251001",
    # Old Sonnet models -> new Sonnet 4.5
    "claude-3-sonnet-20240229": "claude-sonnet-4-5-20250929",
    "claude-3-5-sonnet-20240620": "claude-sonnet-4-5-20250929",
    "claude-3-5-sonnet-20241022": "claude-sonnet-4-5-20250929",
    # Old Opus models -> new Opus 4.1
    "claude-3-opus-20240229": "claude-opus-4-1-20250805",
}

def update_notebook(notebook_path):
    """Update model IDs in a Jupyter notebook"""
    print(f"\nProcessing: {notebook_path}")

    with open(notebook_path, 'r', encoding='utf-8') as f:
        notebook = json.load(f)

    changes = []

    # Iterate through all cells
    for cell_idx, cell in enumerate(notebook.get('cells', [])):
        if 'source' in cell:
            # Handle source as list or string
            if isinstance(cell['source'], list):
                source_text = ''.join(cell['source'])
            else:
                source_text = cell['source']

            original_source = source_text

            # Replace all old model IDs with new ones
            for old_model, new_model in MODEL_MAPPINGS.items():
                if old_model in source_text:
                    source_text = source_text.replace(old_model, new_model)
                    changes.append(f"  Cell {cell_idx}: {old_model} -> {new_model}")

            # Update the cell source if changes were made
            if source_text != original_source:
                if isinstance(cell['source'], list):
                    # Convert back to list format preserving line breaks
                    cell['source'] = [line + '\n' if not line.endswith('\n') and i < len(source_text.split('\n')) - 1 else line
                                     for i, line in enumerate(source_text.split('\n'))]
                    # Clean up: remove trailing empty string if present
                    if cell['source'] and cell['source'][-1] == '':
                        cell['source'].pop()
                else:
                    cell['source'] = source_text

    if changes:
        # Write updated notebook
        with open(notebook_path, 'w', encoding='utf-8') as f:
            json.dump(notebook, f, indent=1, ensure_ascii=False)
            f.write('\n')  # Add trailing newline

        print(f"  Updated {len(changes)} occurrence(s):")
        for change in changes:
            print(change)
        return True
    else:
        print("  No changes needed")
        return False

def main():
    tool_use_dir = Path('/Users/sgrider/code/courses/tool_use')
    notebooks = sorted(tool_use_dir.glob('*.ipynb'))

    print(f"Found {len(notebooks)} notebooks to process")

    updated_count = 0
    for notebook in notebooks:
        if update_notebook(notebook):
            updated_count += 1

    print(f"\n\nSummary: Updated {updated_count} out of {len(notebooks)} notebooks")

if __name__ == '__main__':
    main()

.PHONY: help setup setup-tools setup-pi setup-opencode pi-ask-user pi-plans opencode-question

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Tooling setup:"
	@echo "  setup              Install Pi extensions + OpenCode config"
	@echo "  setup-tools        Same as setup"
	@echo "  setup-pi           Install Pi extensions"
	@echo "  setup-opencode     Enable question tool in OpenCode"
	@echo "  pi-ask-user        Install pi-ask-user extension"
	@echo "  pi-plans           Install pi-plans extension"
	@echo "  opencode-question  Configure OpenCode permission"
	@echo ""
	@echo "Global files: see SETUP.md for manual symlink instructions"

setup: setup-tools
	@echo ""
	@echo "=== Setup complete ==="
	@echo "Pi: Run '/reload' in Pi to activate extensions."
	@echo "OpenCode: Start a new session — question tool is enabled."

setup-tools: setup-pi setup-opencode

setup-pi: pi-ask-user pi-plans

setup-opencode: opencode-question

pi-ask-user:
	@echo "Installing pi-ask-user..."
	pi install npm:pi-ask-user
	@echo "  ✓ pi-ask-user installed"

pi-plans:
	@echo "Installing pi-plans..."
	pi install npm:pi-plans
	@echo "  ✓ pi-plans installed"

opencode-question:
	@echo "Configuring OpenCode question tool..."
	@if [ -f ~/.config/opencode/opencode.json ]; then \
		if grep -q '"question"' ~/.config/opencode/opencode.json; then \
			echo "  ✓ question tool already enabled"; \
		else \
			sed -i '' '2i\  "permission": {\n    "question": "allow"\n  },' ~/.config/opencode/opencode.json; \
			echo "  ✓ question tool enabled (added permission block)"; \
		fi; \
	else \
		echo "  ✗ opencode.json not found"; \
		echo "  Manual: add permission block to your config"; \
	fi

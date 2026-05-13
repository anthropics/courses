# Lesson 10: Evaluating Subjective Behavior with Model-Graded Evals

In lessons 1–9 you learned how to evaluate model outputs using code checks and model-graded evaluators. Those techniques work well for objective tasks — counting legs, classifying topics, summarizing text.

This lesson tackles the harder case: **subjective behavior**. Using AI tutoring as the example domain, you will learn how to operationalize qualities like guidance style, tone, and pedagogical discipline into objective, comparable evaluation signals within a fixed rubric, judge, and dataset protocol — **subjective at the source, objective within the protocol**.

## What you will build

- A **behavioral taxonomy** — 8 dimensions that capture distinct aspects of tutoring quality
- A **deterministic check** — a cheap first gate that catches obvious failures before invoking the judge
- A **frozen rubric judge** — a calibrated, locked evaluator that produces structured output via tool use
- A **mini generate → judge → revise loop** — one iteration of prompt improvement driven by measured signals

## Prerequisites

- Completion of lessons 1–9 (especially lesson 9: custom model-graded evals)
- An Anthropic API key set in a `.env` file: `ANTHROPIC_API_KEY=your_key_here`

## Installation

```bash
pip install anthropic pydantic python-dotenv
```

## Running the lesson

Open `lesson.ipynb` and run cells in order. A clean run makes approximately 20 API calls using Claude Haiku, costing only a few cents (exact cost depends on current model pricing and output length).

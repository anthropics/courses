def basic_summarize(context: dict):
  variables = context['vars']
  return f"Summarize this article {variables['article']}"

def better_summarize(context: dict):
  variables = context['vars']
  return f"""Summarize this article for a grade-school audience: {variables['article']}"""

def best_summarize(context: dict):
  variables = context['vars']
  return f"""\
You are tasked with summarizing long wikipedia articles for a grade-school audience.
Write a short summary, keeping it as concise as possible. 
The summary is intended for a non-technical, grade-school audience. 
This is the article: {variables['article']}"""


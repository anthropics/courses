def basic_summarize(article):
  return f"Summarize this article {article}"

def better_summarize(article):
  return f"""
  Summarize this article for a grade-school audience: {article}"""

def best_summarize(article):
  return f"""
  You are tasked with summarizing long wikipedia articles for a grade-school audience.
  Write a short summary, keeping it as concise as possible. 
  The summary is intended for a non-technical, grade-school audience. 
  This is the article: {article}"""


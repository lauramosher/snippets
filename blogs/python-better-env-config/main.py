import project.config as config

config.run_days_ago = 5

from project import Thinger

def main():
  Thinger().call()

if __name__ == "__main__":
  main()

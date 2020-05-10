import os

from datetime import datetime, timedelta

import logging

logger = logging
logger.getLogger().setLevel(logging.INFO)

run_days_ago = 1

day = datetime.today() - timedelta(days=run_days_ago)

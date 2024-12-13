# dst_utils.py
from datetime import datetime, timedelta
import pytz

class DSTUtils:
    @staticmethod
    def get_dst_info(timezone_name, date=None):
        if date is None:
            date = datetime.now()
        
        tz = pytz.timezone(timezone_name)
        localized_date = tz.localize(date)
        is_dst = bool(localized_date.dst())
        dst_offset_hours = localized_date.dst().total_seconds() / 3600 if is_dst else 0
        
        return {
            "is_dst": is_dst,
            "dst_offset_hours": dst_offset_hours,
            "utc_offset_hours": localized_date.utcoffset().total_seconds() / 3600
        }




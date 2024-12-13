# dst_transition_library.py
from datetime import datetime, timedelta
import pytz

class DSTTransitionLibrary:
    @staticmethod
    def get_next_dst_info(timezone_name, date=None):
        if date is None:
            date = datetime.now()
        # Get the timezone
        tz = pytz.timezone(timezone_name)
        
        # Localize the provided date to the specified timezone
        localized_date = tz.localize(date)

        # Get the current time in the specified timezone
        now = datetime.now(tz)

        # Check if DST is currently active
        is_dst_now = bool(now.dst())

        # Start checking from the current time
        next_transition = now + timedelta(days=1)  # Start checking from tomorrow
        while True:
            
            # Create a naive datetime for the next transition date
            naive_next_transition = next_transition.replace(tzinfo=None)
            
            
            # Localize the naive datetime
            localized_next_transition = tz.localize(naive_next_transition)

            # Check if the next transition is a DST transition
            if localized_next_transition.dst() != is_dst_now:

                 # Extract components from the transition time
                transition_time = localized_next_transition

                # direction = "forward" if next_transition.dst() else "backward"
                # return {
                #     "transition_time": next_transition,
                #     "direction": direction
                # }

                return {
                    'year': transition_time.year,
                    'month': transition_time.month,
                    'day': transition_time.day,
                    'hours': transition_time.hour,
                    'minutes': transition_time.minute,
                    'seconds': transition_time.second,
                    'msec': transition_time.microsecond,
                    'timezone': str(localized_next_transition.tzinfo),
                    'direction': "forward" if localized_next_transition.dst() else "backward"
                }

            # Move to the next day
            next_transition += timedelta(days=1)
            return "No upcoming DST transition found."






        # # Get the next DST transition
        # next_transition = None
        # for transition_time in tz._utc_transition_times:
        #     localized_transition_time = tz.localize(transition_time)
        #     if localized_transition_time > now:
        #         next_transition = localized_transition_time
        #         break
        
        # if next_transition:
        #     is_dst_now = bool(now.dst())
        #     is_dst_transition = bool(next_transition.dst())
        #     direction = "forward" if is_dst_transition else "backward"
        #     return {
        #         "transition_time": next_transition,
        #         "direction": direction
        #     }
        
        # return "No upcoming DST transition found."



        # # Iterate over DST transition times in the future
        # for dst_transition in tz._utc_transition_times:
        #     transition_time = tz.localize(dst_transition)
            
        #     # Find the next DST transition after the current time
        #     if transition_time > now:
        #         # Check if DST is starting (forward) or ending (backward)
        #         is_dst_now = bool(now.dst())
        #         is_dst_transition = bool(transition_time.dst())
                
        #         if is_dst_now != is_dst_transition:
        #             direction = "forward" if is_dst_transition else "backward"
        #             # return f"{transition_time}, {direction}"
        #             return {
        #                 "transition_time": transition_time,
        #                 "direction": direction
        #             }
        
        # # Return None if no future DST transition is found
        # return "No upcoming DST transition found."

# def get_next_dst_transition(timezone_name):
#     # Get the timezone
#     tz = pytz.timezone(timezone_name)
    
#     # Get the current time in the specified timezone
#     now = datetime.now(tz)
    
#     # Iterate over DST transition times in the future
#     for dst_transition in tz._utc_transition_times:
#         transition_time = tz.localize(dst_transition)
        
#         # Find the next DST transition after the current time
#         if transition_time > now:
#             # Check if DST is starting (forward) or ending (backward)
#             is_dst_now = bool(now.dst())
#             is_dst_transition = bool(transition_time.dst())
            
#             if is_dst_now != is_dst_transition:
#                 direction = "forward" if is_dst_transition else "backward"
#                 return f"{transition_time}, {direction}"
    
#     # Return None if no future DST transition is found
#     return None

# class DSTTransitionLibrary:
#     def get_next_dst(self, timezone_name):
#         result = get_next_dst_transition(timezone_name)
#         return result if result else "No upcoming DST transition found."

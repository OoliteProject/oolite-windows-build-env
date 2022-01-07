/* Reentrant time functions like localtime_r.

   Copyright (C) 2003, 2006-2007, 2010-2016 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU Lesser General Public License as published by
   the Free Software Foundation; either version 2.1, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public License along
   with this program; if not, see <http://www.gnu.org/licenses/>.  */

/* Written by Paul Eggert.  */

#include <config.h>

#if 1
#include <time.h>
#else
#include <stdint.h>
typedef int32_t __time32_t;
typedef	__time32_t time_t;
struct tm
{
	int	tm_sec;		/* Seconds: 0-59 (K&R says 0-61?) */
	int	tm_min;		/* Minutes: 0-59 */
	int	tm_hour;	/* Hours since midnight: 0-23 */
	int	tm_mday;	/* Day of the month: 1-31 */
	int	tm_mon;		/* Months *since* january: 0-11 */
	int	tm_year;	/* Years since 1900 */
	int	tm_wday;	/* Days since Sunday (0-6) */
	int	tm_yday;	/* Days since Jan. 1: 0-365 */
	int	tm_isdst;	/* +1 Daylight Savings Time, 0 No DST,
				 * -1 don't know */
};
#endif

static struct tm *
copy_tm_result (struct tm *dest, struct tm const *src)
{
  if (! src)
    return 0;
  *dest = *src;
  return dest;
}


struct tm *
gmtime_r (time_t const * restrict t, struct tm * restrict tp)
{
  return copy_tm_result (tp, gmtime (t));
}

struct tm *
localtime_r (time_t const * restrict t, struct tm * restrict tp)
{
  return copy_tm_result (tp, localtime (t));
}

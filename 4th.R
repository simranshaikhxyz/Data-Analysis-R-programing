
library(dplyr)
library(readr)

df <- read_csv("C:/Users/Lenovo/Documents/College_Marks_Dataset.csv")


# Students with SSC > 90
high_ssc <- subset(df, SSC_Marks > 90)
cat("SSC > 90:", nrow(high_ssc), "\n")
head(high_ssc)

# Students with HSC > 85 AND College Marks > 80
high_hsc_college <- subset(df, HSC_Marks > 85 & College_Marks > 80)
cat("HSC > 85 and College > 80:", nrow(high_hsc_college), "\n")
head(high_hsc_college)

# Students with Attendance < 75 OR Grade A
special_students <- subset(df, Attendance_Percentage < 75 | Grade == "A")
cat("Low attendance or Grade A:", nrow(special_students), "\n")
head(special_students)


# Students with Attendance > 90
high_attendance <- df |> filter(Attendance_Percentage > 90)
cat("Attendance > 90:", nrow(high_attendance), "\n")
summary(high_attendance$Attendance_Percentage)

# Students with Grade A or B
top_grades <- df |> filter(Grade %in% c("A", "B"))
cat("Grade A or B:", nrow(top_grades), "\n")
table(top_grades$Grade)

# Sorting by College_Marks descending, then HSC_Marks descending
top_students <- df |> arrange(desc(College_Marks), desc(HSC_Marks))
head(top_students, 10)

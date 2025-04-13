library(tidyverse)

#### load data ####

sample1<-read_delim("results/filesForR/collapsed_1_classification.filtered_lite_classification.txt.gz", delim = "\t", col_names = TRUE) %>% 
  rename_with(~str_replace(., "BioSample_\\d", "BioSample"), contains("BioSample")) %>%
  mutate(sampleName = "sample1")

sample2<-read_delim("results/filesForR/collapsed_2_classification.filtered_lite_classification.txt.gz", delim = "\t", col_names = TRUE) %>%
  rename_with(~str_replace(., "BioSample_\\d", "BioSample"), contains("BioSample")) %>%
  mutate(sampleName = "sample2")

sample3<-read_delim("results/filesForR/collapsed_3_classification.filtered_lite_classification.txt.gz", delim = "\t", col_names = TRUE) %>%
  rename_with(~str_replace(., "BioSample_\\d", "BioSample"), contains("BioSample")) %>%
  mutate(sampleName = "sample3")

sample4<-read_delim("results/filesForR/collapsed_4_classification.filtered_lite_classification.txt.gz", delim = "\t", col_names = TRUE) %>% 
  rename_with(~str_replace(., "BioSample_\\d", "BioSample"), contains("BioSample")) %>%
  mutate(sampleName = "sample4")

## merge data
df<-rbind(sample1, sample2, sample3, sample4)

## summary table
df_summary <- df %>% group_by(sampleName, chrom, structural_category) %>% summarise(n = n()) 

# plot
df_summary %>% ggplot() + 
  geom_bar(aes(x = chrom, y = n, fill = structural_category), 
           stat = "identity", position = "dodge") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Isoseq variants by chromosome and category across all samples", x = "Chromosome", y = "Number of structural variants", fill = "Category")

### X and Y only
df_summary %>% filter(chrom %in% c("X", "Y")) %>% ggplot() + 
  geom_bar(aes(x = chrom, y = n, fill = structural_category), 
           stat = "identity", position = "dodge") +
  facet_wrap(~sampleName) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Isoseq variants by chromosome and category across all samples", x = "Chromosome", y = "Number of structural variants", fill = "Category")

df <- df %>% mutate(sex = case_when(sampleName == "sample1", ~ "Male","Female"))
                    
## plot read counts


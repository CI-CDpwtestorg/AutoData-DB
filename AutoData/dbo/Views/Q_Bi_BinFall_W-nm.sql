CREATE VIEW dbo.[Q_Bi_BinFall_W-nm]
AS
SELECT        TOP (100) PERCENT sp.SessionDate, sp.Machine, sp.Comment1, sp.Comment2, sp.SPSessionName, 
                         sp.[ID#] + N'-' + sp.[RUN#] + N'-' + sp.Wafer_log AS Lot, COUNT_BIG(sp.SessionDate) AS [Wafers In], SUM(CASE WHEN DestinationStationID = 2 THEN 1 ELSE 0 END) 
                         AS Passed, SUM(CASE WHEN DispositionName = 'Rejected' THEN 1 WHEN DispositionName = 'Overload' THEN 1 ELSE 0 END) AS Rejects, SUM(CASE WHEN DispositionName = 'Overload' THEN 1 ELSE 0 END) 
                         AS OverLoads, SUM(CASE WHEN DestinationStationID = 2 THEN 1 ELSE 0 END) AS Bin2, SUM(CASE WHEN DestinationStationID = 3 THEN 1 ELSE 0 END) AS Bin3, sp.[ID#], sp.[RUN#], 
                         sp.Wafer_log, proc_i.LASER_NOTE3 AS Spec, proc_i.ID_TRANSFER7 AS nm, main_i.Diameter, 
                         CASE WHEN Comment1 LIKE N'%-1' THEN 'CMP1' WHEN Comment1 LIKE N'%-2' THEN 'CMP2' WHEN Comment1 LIKE N'%-3' THEN 'CMP3' WHEN Comment1 LIKE N'%-4L' THEN 'CMP4L' WHEN Comment1 LIKE N'%-4R'
                          THEN 'CMP4R' WHEN Comment1 LIKE N'%-5' THEN 'CMP5' ELSE 'No Data' END AS CMP
FROM            dbo.SP1_Data AS sp INNER JOIN
                         [$(ALTS)].dbo.PROCESS_INFO AS proc_i ON sp.[ID#] = proc_i.ID_NUMBER INNER JOIN
                         [$(ALTS)].dbo.MainID AS main_i ON sp.[ID#] = main_i.MainID
GROUP BY sp.Machine, sp.SPSessionName, sp.SessionDate, sp.[ID#], sp.[RUN#], sp.Wafer_log, 
                         sp.[ID#] + N'-' + sp.[RUN#] + N'-' + sp.Wafer_log, 
                         CASE WHEN Comment1 LIKE N'%-1' THEN 'CMP1' WHEN Comment1 LIKE N'%-2' THEN 'CMP2' WHEN Comment1 LIKE N'%-3' THEN 'CMP3' WHEN Comment1 LIKE N'%-4L' THEN 'CMP4L' WHEN Comment1 LIKE N'%-4R'
                          THEN 'CMP4R' WHEN Comment1 LIKE N'%-5' THEN 'CMP5' ELSE 'No Data' END, sp.Comment1, sp.Comment2, sp.WaferDia, proc_i.LASER_NOTE3, 
                         proc_i.ID_TRANSFER7, main_i.Diameter
HAVING        (NOT (sp.[ID#] = N'move')) AND (NOT (sp.[RUN#] = N'99999')) AND (NOT (sp.Wafer_log = N'99999')) AND (main_i.Diameter = 300)
ORDER BY sp.SessionDate DESC

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[40] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SP1_Data"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 162
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "PROCESS_INFO (ALTS.dbo)"
            Begin Extent = 
               Top = 21
               Left = 414
               Bottom = 183
               Right = 695
            End
            DisplayFlags = 280
            TopColumn = 51
         End
         Begin Table = "MainID (ALTS.dbo)"
            Begin Extent = 
               Top = 44
               Left = 942
               Bottom = 206
               Right = 1170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 2295
         Width = 1170
         Width = 1320
         Width = 1320
         Width = 1665
         Width = 2250
         Width = 900
         Width = 705
         Width = 720
         Width = 1005
         Width = 510
         Width = 510
         Width = 1140
         Width = 900
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 34
         Column = 30435
         Alias = 2715
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2655
         Or = 1350
         Or = 1350
         Or = ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Q_Bi_BinFall_W-nm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Q_Bi_BinFall_W-nm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Q_Bi_BinFall_W-nm';


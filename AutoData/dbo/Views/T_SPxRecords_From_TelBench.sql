CREATE VIEW dbo.T_SPxRecords_From_TelBench
AS
SELECT        TOP (100) PERCENT CAST(tscan.Instance AS varchar(25)) AS Instance, tscan.ScanTime AS Instance_ScanTime, sp.Entry, 
                         sp.Machine, sp.CreationDate, sp.SPSessionName, sp.SPRecipeName, sp.SessionDate, sp.[ID#], sp.[RUN#], 
                         sp.Wafer_log, sp.Comment1, sp.Comment2, sp.SourceSlotID, sp.DestinationStationID, sp.DestinationSlotID, sp.ChannelID, 
                         sp.DispositionName, sp.SumAllDefects, sp.FailedLimit, sp.AreaCnt, sp.TotalArea, sp.ScratchCnt, sp.ScratchTotalLength, 
                         sp.ScratchAveLength, sp.ScratchMaxLength, sp.ClusterAreaCnt, sp.LPDECnt, sp.LPDSCnt, sp.PosCnt, sp.NegCnt, 
                         sp.WaferPosAvgDensity, sp.WaferPosMean, sp.WaferPosStdDev, sp.WaferNegAvgDensity, sp.WaferNegMean, sp.WaferNegStdDev, 
                         sp.BinCnt1, sp.BinCnt2, sp.BinCnt3, sp.BinCnt4, sp.BinCnt5, sp.BinCnt6, sp.BinCnt7, sp.BinCnt8, 
                         sp.BinCnt18, sp.RangeMin, sp.RangeMax, sp.TotalNCDefectsCount, sp.LPDNBinCntInSize1, sp.LPDNBinCntInSize2, 
                         sp.LPDNBinCntInSize3, sp.LPDNBinCntInSize4, sp.LPDNBinCntInSize5, sp.LPDNBinCntInSize6, sp.LPDNBinCntInSize7, 
                         sp.LPDNBinCntInSize8, sp.LPDNBinCntInSize18, sp.SOD1, sp.SOD2, sp.SOD3, sp.SOD4, sp.SOD5, sp.SOD6, 
                         sp.SOD7, sp.SOD8, sp.SOD18, sp.Average, sp.Peak, sp.Median, sp.StdDeviation, sp.Thruput, 
                         sp.WaferDia, sp.EdgeExclusion, sp.WaferIdLabel, sp.Comment, sp.Map, sp.RFID
FROM            dbo.SP1_Data AS sp INNER JOIN
                         [$(ALTS)].dbo.T_Tool_Instance_Scan_Log AS tscan ON sp.Comment2 = CAST(tscan.Instance AS varchar(25))
WHERE        (tscan.Tool = N'TITEL01')
ORDER BY sp.Entry

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[51] 2[9] 3) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SP1_Data"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 283
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_Tool_Instance_Scan_Log (ALTS.dbo)"
            Begin Extent = 
               Top = 7
               Left = 398
               Bottom = 277
               Right = 742
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
      Begin ColumnWidths = 80
         Width = 284
         Width = 975
         Width = 1980
         Width = 840
         Width = 1110
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 480
         Width = 630
         Width = 960
         Width = 1065
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 150', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_SPxRecords_From_TelBench';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'0
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6045
         Alias = 1485
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_SPxRecords_From_TelBench';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'T_SPxRecords_From_TelBench';


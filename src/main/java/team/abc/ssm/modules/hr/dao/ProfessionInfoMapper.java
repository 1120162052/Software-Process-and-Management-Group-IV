package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.ProfessionInfo;

public interface ProfessionInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(ProfessionInfo record);

    int insertOrUpdate(ProfessionInfo record);

    int insertOrUpdateSelective(ProfessionInfo record);

    int insertSelective(ProfessionInfo record);

    ProfessionInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ProfessionInfo record);

    int updateByPrimaryKey(ProfessionInfo record);

    int updateBatch(List<ProfessionInfo> list);

    int batchInsert(@Param("list") List<ProfessionInfo> list);
}